import 'package:flutter/material.dart';
import 'package:shella_design/features/profile_detailes/domain/models/customer_info_model.dart';
import 'package:shella_design/features/profile_detailes/domain/services/customer_info_services.dart';

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
        customer = result;
        notifyListeners();
      } else {
        toExternalReference = 'فشل في تحميل بيانات العميل.';
      }
    } catch (e) {
      toExternalReference = 'خطأ غير متوقع: $e';
    }
  }
}