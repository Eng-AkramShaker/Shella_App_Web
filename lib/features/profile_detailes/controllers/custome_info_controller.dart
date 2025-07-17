import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shella_design/features/profile_detailes/domain/models/customer_info_model.dart';
import 'package:shella_design/features/profile_detailes/domain/services/customer_info_services.dart';

import '../../../common/helper/app_routes.dart';
import '../widgets/profile_details_dialog.dart';

class CustomerController extends ChangeNotifier {
  final CustomerService service;
  CustomerModel? customer;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchCustomerData() async {
    _isLoading = true;
    notifyListeners();
    await loadCustomerInfo();
    _isLoading = false;
    notifyListeners();
  }

  CustomerController({required this.service});

  String? toExternalReference;

  Future<void> loadCustomerInfo() async {
    try {
      final result = await service.getCustomerInfo();
      if (result != null) {
        print("✅ تم جلب البيانات: ${result.fullName}");
        customer = result;
        notifyListeners();
      } else {
        toExternalReference = 'فشل في تحميل بيانات العميل.';
      }
    } catch (e) {
      toExternalReference = 'حدثت مشكلة في الاتصال!';
    }
  }

  Future<bool> updateProfileInfo(
    Map<String, dynamic> data, {
    XFile? imageFile,
    bool isImageRemoved = false,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final apiData = {
        'name': data['full_name'],
        'phone': data['phone'],
        'email': data['email'],
      };
      if (isImageRemoved) {
        apiData['image'] = 'DELETE';
      }
      print("🚀 إرسال بيانات التحديث: $apiData");
      final shouldUpdate = apiData['name'] != customer?.fullName ||
          apiData['phone'] != customer?.phone ||
          apiData['email'] != customer?.email ||
          imageFile != null ||
          isImageRemoved;

      if (!shouldUpdate) {
        // _isLoading = false;
        // notifyListeners();
        return true;
      }
      ////// final updatedCustomer = await service.updateCustomerInfo(apiData);
      CustomerModel? updatedCustomer;
      if (imageFile != null) {
        updatedCustomer = await service.updateCustomerInfoWithImage(
          apiData,
          imageFile: imageFile,
        );
      } else if (isImageRemoved) {
        apiData['image'] = ''; // إشارة لحذف الصورة
        updatedCustomer = await service.updateCustomerInfo(apiData);
      } else {
        updatedCustomer = await service.updateCustomerInfo(apiData);
      }
      if (updatedCustomer != null) {
        customer = updatedCustomer;
        // await fetchCustomerData();
        print('تم التحديث بنجاح');
        return true;
      }
      print('❌ لم يتم التحديث - response null');
      return false;
    } catch (e) {
      print('حدث خطأ: ${e.toString()}');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

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
}
