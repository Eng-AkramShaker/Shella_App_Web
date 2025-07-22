// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shella_design/features/settings/domain/models/customer_info_model.dart';
import 'package:shella_design/features/settings/domain/services/customer_info_services.dart';
import '../../../common/helper/app_routes.dart';
import '../widgets/profile_details_dialog.dart';

class ProfileController extends ChangeNotifier {
  final CustomerService service;

  User_Model? user;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchUserData() async {
    _isLoading = true;
    notifyListeners();
    await loadCustomerInfo();
    _isLoading = false;
    notifyListeners();
  }

  ProfileController({required this.service});

  String? toExternalReference;

  Future<void> loadCustomerInfo() async {
    try {
      final result = await service.getUserInfo();
      if (result != null) {
        print("✅ تم جلب البيانات: ${result.fullName}");
        user = result;
        notifyListeners();
      } else {
        toExternalReference = 'فشل في تحميل بيانات العميل.';
      }
    } catch (e) {
      toExternalReference = 'حدثت مشكلة في الاتصال!';
    }
  }

  Future<bool> updateProfileInfo(Map<String, dynamic> data) async {
    try {
      _isLoading = true;
      notifyListeners();
      final apiData = {
        'name': data['full_name'],
        'phone': data['phone'],
        'email': data['email'],
      };
      final shouldUpdate = apiData['name'] != user?.fullName || apiData['phone'] != user?.phone || apiData['email'] != user?.email;

      if (!shouldUpdate) {
        _isLoading = false;
        notifyListeners();
        return true; // No changes needed
      }
      final updatedUser = await service.updatedUserInfo(apiData);

      if (updatedUser != null) {
        user = updatedUser;
        print('تم التحديث بنجاح');
        return true;
      }
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
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginPage, (route) => false);
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
