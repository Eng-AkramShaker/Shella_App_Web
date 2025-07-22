import 'package:flutter/material.dart';
import 'package:shella_design/features/home/domain/models/section_model.dart';
import 'package:shella_design/features/home/domain/services/section_service.dart';
import 'package:shella_design/features/search_filter/domain/models/mostSearchedModel/most_searched_model.dart';

class SectionProvider with ChangeNotifier {
  final SectionService _sectionService;

  SectionProvider(this._sectionService);

  List<SectionModel> _categories = [];
    List<Module> _modules = [];

  bool _isLoading = false;
  bool _isLoading2=false;
  String _errorMessage = '';
    String _errorMessage2 = '';


  List<SectionModel> get categories => _categories;
  List<Module> get modules =>_modules;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
   bool get isLoading2 => _isLoading2;
  String get errorMessage2 => _errorMessage2;

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

   Future<void> fetchModules() async {
    _isLoading2 = true;
    notifyListeners();

    try {
      _modules = await _sectionService.fetchModules();
      _errorMessage2 = '';
    } catch (e) {
      _errorMessage2 = 'Failed to load Modules';
    } finally {
      _isLoading2 = false;
      notifyListeners();
    }
  }
}
