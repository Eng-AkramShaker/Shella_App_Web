import 'package:flutter/material.dart';
import 'package:shella_design/features/home/domain/models/category_model.dart';
import 'package:shella_design/features/home/domain/services/category_service.dart';
class CategoryProvider with ChangeNotifier {
  final CategoryService _categoryService;

  CategoryProvider(this._categoryService);

  List<CategoryModel> _categories = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await _categoryService.fetchCategories();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load categories';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
