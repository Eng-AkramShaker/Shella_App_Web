import 'package:flutter/material.dart';

import 'package:shella_design/features/product/domain/models/product_model.dart';
import 'package:shella_design/features/product/domain/services/product_service.dart';
import 'package:shella_design/features/search_filter/controller/Product_servide.dart';

// lib/providers/product_provider.dart
class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final ProductServices _productService = ProductServices();

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null; // Clear previous errors
    notifyListeners(); // Notify listeners that loading has started

    try {
      _products = await _productService.fetchPopularProducts();
      _errorMessage = null; // Clear error on success
    } catch (e) {
      _errorMessage = e.toString();
      _products = []; // Clear products on error
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners that loading has finished or an error occurred
    }
  }
}
