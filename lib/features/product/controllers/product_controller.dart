import 'package:flutter/material.dart';
import 'package:shella_design/features/product/domain/models/product_model.dart';
import 'package:shella_design/features/product/domain/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _service = ProductService();
  final int storeId;

  List<Product> _products = [];
  bool _isLoading = false;
  int _offset = 1;
  bool _hasMore = true;
  final int _limit = 13;

  ProductProvider({required this.storeId});

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> loadProducts({bool refresh = false}) async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      if (refresh) {
        _products.clear();
        _offset = 1;
        _hasMore = true;
      }

      final newProducts = await _service.fetchProducts(
        storeId: storeId,
        categoryId: _selectedCategoryId ?? 0,
        offset: _offset,
        limit: _limit,
      );

      if (newProducts.length < _limit) {
        _hasMore = false;
      }

      _products.addAll(newProducts);
      _offset++;
    } catch (e) {
      print('Error loading products: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  int? _selectedCategoryId;

  int? get selectedCategoryId => _selectedCategoryId;

  void setCategory(int? categoryId) {
    _selectedCategoryId = categoryId;
    _products.clear();
    _offset = 1;
    _hasMore = true;
    loadProducts();
  }
}
