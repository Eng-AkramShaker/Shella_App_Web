import 'package:flutter/material.dart';
import 'package:shella_design/features/product/domain/models/carrefour_model.dart';
import 'package:shella_design/features/product/domain/services/carfor.dart';

class FoodCategoryProvider with ChangeNotifier {
  final FoodCategoryService _service;

  FoodCategoryProvider(this._service);

  List<FoodCategory> _categories = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentOffset = 0;
  final int _limit = 10;
  String _errorMessage = '';

  List<FoodCategory> get categories => _categories;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get hasMore => _hasMore;
  Future<void> fetchMoreCategories() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newItems = await _service.fetchFoodCategories(
        start: _currentOffset,
        limit: _limit,
      );

      if (newItems.length < _limit) {
        _hasMore = false;
      }

      _categories.addAll(newItems);
      _currentOffset += newItems.length;
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load food categories';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
