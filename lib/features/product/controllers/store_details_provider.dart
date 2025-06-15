import 'package:flutter/material.dart';
import 'package:shella_design/features/product/domain/models/store_details_model.dart';
import 'package:shella_design/features/product/domain/repositories/product_repository.dart';

class StoreDetailsProvider with ChangeNotifier {
  final StoreRepository _repository;
  final int storeId;

  StoreDetailsModel? _storeDetails;
  final List<ProductModel> _products = [];

  bool _isLoading = false;
  bool _isLoadingStoreDetails = false;
  bool _hasMore = true;
  int _offset = 1;

  static const int _limit = 13;
  int? _selectedCategoryId;

  StoreDetailsProvider({
    required this.storeId,
    StoreRepository? repository,
  }) : _repository = repository ?? StoreRepository();

  StoreDetailsModel? get storeDetails => _storeDetails;
  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  bool get isLoadingStoreDetails => _isLoadingStoreDetails;
  bool get hasMore => _hasMore;
  int? get selectedCategoryId => _selectedCategoryId;

  Future<void> loadStoreDetails() async {
    _isLoadingStoreDetails = true;
    notifyListeners();

    try {
      _storeDetails = await _repository.getStoreDetails(storeId);

      if (_storeDetails?.categories.isEmpty ?? true) {
        await Future.delayed(const Duration(seconds: 2));
        _storeDetails = await _repository.getStoreDetails(storeId);
      }

      if ((_storeDetails?.categories.isNotEmpty ?? false) &&
          _selectedCategoryId == null) {
        _selectedCategoryId = _storeDetails!.categories.first.id;
      }
    } catch (e) {
      debugPrint('Error loading store details: $e');
    } finally {
      _isLoadingStoreDetails = false;
      notifyListeners();
    }
  }

  Future<void> loadProducts({bool refresh = false}) async {
    if (_isLoading || (!_hasMore && !refresh)) return;

    if (refresh) {
      _products.clear();
      _offset = 1;
      _hasMore = true;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final categoryId = _selectedCategoryId ?? 0;
      final newProducts = await _repository.getProducts(
        storeId: storeId,
        categoryId: categoryId,
        offset: _offset,
        limit: _limit,
      );

      if (newProducts.length < _limit) {
        _hasMore = false;
      }

      _products.addAll(newProducts);
      _offset++;
    } catch (e) {
      debugPrint('Error loading products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setCategory(int? categoryId) {
    if (_selectedCategoryId == categoryId) return;

    _selectedCategoryId = categoryId;
    _products.clear();
    _offset = 1;
    _hasMore = true;
    notifyListeners();
    loadProducts();
  }
}
