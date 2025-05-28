import 'package:flutter/material.dart';
import 'package:shella_design/features/discount/domain/models/discount_model.dart';
import 'package:shella_design/features/discount/domain/services/discountServiceInterface/discount_service_interface.dart';

class DiscountController extends ChangeNotifier {
  final DiscountServiceInterface _service;

  List<DiscountProduct> _products = [];
  bool _isLoading = false;
  String? _error;

  DiscountController({required service})
      : _service = service;

  List<DiscountProduct> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadDiscountedProducts() async {
    try {
     
      _isLoading = true;
      _error = null;
      notifyListeners();

      _products = await _service.fetchDiscountedProducts(offset: '2');
      
     // print('🟢 [Controller] Products loaded: ${_products.length} items');
      if (_products.isNotEmpty) {
      }

      if (_products.isEmpty) {
        _error = 'لا توجد منتجات مخفضة متاحة حالياً';
      }
    } catch (e) {
      _error = 'حدث خطأ في جلب البيانات: ${e.toString()}';
     // print('🔴 [Controller Error] $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
      //print('🟣 [Controller] Loading completed');
    }
  }
}