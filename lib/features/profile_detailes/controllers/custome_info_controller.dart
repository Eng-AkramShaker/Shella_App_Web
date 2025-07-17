// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
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

  // void showEditDialog(
  //   BuildContext context,
  //   String fieldTitle,
  //   String currentValue,
  //   Function(String) onSave,
  // ) {
  //   TextEditingController controller =
  //       TextEditingController(text: currentValue);
  //
  //   CustomDialog.showCustomDialog(
  //           context: context,
  //           title: 'تعديل $fieldTitle',
  //           customContent: TextField(
  //             controller: controller,
  //             decoration: InputDecoration(
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //             ),
  //           ),
  //           onConfirm: () {})
  //       .then((confirmed) {
  //     if (confirmed == true) {
  //       onSave(controller.text);
  //     }
  //   });
  // }

  Future<bool> updateProfileInfo(Map<String, dynamic> data) async {
    try {
      _isLoading = true;
      notifyListeners();
      final apiData = {
        'name': data['full_name'],
        'phone': data['phone'],
        'email': data['email'],
      };
      final shouldUpdate =
          apiData['name'] != customer?.fullName || apiData['phone'] != customer?.phone || apiData['email'] != customer?.email;

      if (!shouldUpdate) {
        _isLoading = false;
        notifyListeners();
        return true; // No changes needed
      }
      final updatedCustomer = await service.updateCustomerInfo(apiData);
      // final updateData = {
      //   'name': field,
      //   'value': newValue,
      // };

      // final updatedCustomer = await service.updateCustomerInfo(updateData);

      if (updatedCustomer != null) {
        customer = updatedCustomer;
        // await fetchCustomerData();
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
