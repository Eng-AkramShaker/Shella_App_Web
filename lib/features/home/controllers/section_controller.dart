import 'package:flutter/material.dart';
import 'package:shella_design/features/home/domain/models/section_model.dart';
import 'package:shella_design/features/home/domain/services/section_service.dart';

class SectionProvider with ChangeNotifier {
  final SectionService _sectionService;

  SectionProvider(this._sectionService);

  List<SectionModel> _categories = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<SectionModel> get categories => _categories;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await _sectionService.fetchCategories();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load categories';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
