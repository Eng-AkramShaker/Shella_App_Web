// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/profile_details_dialog.dart';
import 'package:shella_design/features/settings/domain/models/customer_info_model.dart';
import 'package:shella_design/features/settings/domain/services/customer_info_services.dart';

class ProfileController extends ChangeNotifier {
  final CustomerService service;
  User_Model? user;
  bool _isLoading = false;

  /// Image variable
  XFile? _pickedImage;
  bool _isImageRemoved = false;
  bool _hasChanges = false;

  // Getters
  bool get isLoading => _isLoading;

  XFile? get pickedImage => _pickedImage;

  bool get isImageRemoved => _isImageRemoved;
  String? toExternalReference;

  bool get hasChanges => _hasChanges;
  ProfileController({required this.service});

  /// Fetch

  Future<void> fetchUserData() async {
    _isLoading = true;
    notifyListeners();
    await loadCustomerInfo();
    _isLoading = false;
    notifyListeners();
  }

  /// Load Customer Info
  Future<void> loadCustomerInfo() async {
    try {
      final result = await service.getCustomerInfo();
      if (result != null) {
        // print("✅ تم جلب البيانات: ${result.fullName}");
        user = result;
        notifyListeners();
      } else {
        toExternalReference = 'فشل في تحميل بيانات العميل.';
      }
    } catch (e) {
      toExternalReference = 'حدثت مشكلة في الاتصال!';
    }
  }

  /// Update Profile Info
  Future<bool> updateProfileInfo(
    Map<String, dynamic> data, {
    XFile? imageFile,
    bool isImageRemoved = false,
    BuildContext? context,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final apiData = {
        'name': data['full_name'],
        'phone': data['phone'],
        'email': data['email'],
      };
      User_Model? updatedCustomer;
      if (isImageRemoved) {
        apiData['image'] = "";
        updatedCustomer = await service.updateCustomerInfo(apiData);
      } else if (imageFile != null) {
        updatedCustomer = await service.updateCustomerInfoWithImage(
          apiData,
          imageFile: imageFile,
        );
      } else {
        updatedCustomer = await service.updateCustomerInfo(apiData);
      }

      // if (imageFile != null) {
      //   updatedCustomer = await service.updateCustomerInfoWithImage(
      //     apiData,
      //     imageFile: imageFile,
      //   );
      // } else {
      //   updatedCustomer = await service.updateCustomerInfo(apiData);
      // }

      user = updatedCustomer;
      _pickedImage = null;
      _isImageRemoved = false;

      // print('تم التحديث بنجاح');

      return true;
    } catch (e) {
      print('حدث خطأ: ${e.toString()}');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Delete Account
  Future<void> deleteAccount(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      final success = await service.deleteAccount();
      if (success) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.loginPage, (route) => false);
      } else {
        throw Exception('فشل في حذف الحساب');
      }
    } catch (e) {
      print('حدث خطأ: ${e.toString()}');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Dialog Confirm Delete Account
  void deleteDialog(BuildContext context, Function() onTap) {
    CustomDialog.showCustomDialog(
      context: context,
      title: "هل أنت متأكد؟\nسيتم حذف حسابك وجميع بياناتك بشكل نهائي!",
      onConfirm: () {
        onTap();
      },
      customContent: Text(""),
    );
  }

  /// Verified of Changes
  void checkForChanges(String fullName, String phone, String email) {
    final hasTextChanges = fullName != (user?.fullName ?? '') ||
        phone != (user?.phone ?? '') ||
        email != (user?.email ?? '');

    _hasChanges = hasTextChanges || _pickedImage != null || _isImageRemoved;
    notifyListeners();
  }

  /// Choose Image
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      _pickedImage = pickedImage;
      _isImageRemoved = false;
      _hasChanges = true;
      notifyListeners();
    }
  }

  /// Remove Image
  void removeImage() {
    _pickedImage = null;
    _isImageRemoved = true;
    _hasChanges = true;

    notifyListeners();
  }

  /// Options Choose Image
  void showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (user?.image != null || _pickedImage != null) ...[
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text('حذف الصورة'),
                  onTap: () {
                    removeImage();
                    Navigator.pop(context);
                  },
                ),
                Divider(),
              ],
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('اختيار من المعرض'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('فتح الكاميرا'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Save Changes
  Future<void> saveProfileChanges(
    BuildContext context,
    Map<String, String> updateData,
  ) async {
    if (!_hasChanges) {
      Navigator.pop(context);
      return;
    }

    if (updateData['email']?.isEmpty ?? true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('البريد الإلكتروني مطلوب'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final success = await updateProfileInfo(
        updateData,
        imageFile: _pickedImage,
        isImageRemoved: _isImageRemoved,
      );

      if (success) {
        user = await service.getCustomerInfo();
        _pickedImage = null;
        _isImageRemoved = false;
        _hasChanges = false;
        notifyListeners();
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في تحديث البيانات'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدثت مشكلة في الاتصال'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
