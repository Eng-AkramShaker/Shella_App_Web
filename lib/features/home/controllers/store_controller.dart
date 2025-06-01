import 'package:flutter/material.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';
import 'package:shella_design/features/home/domain/repositories/home_repository.dart';

class StoreProvider with ChangeNotifier {
  final HomeRepository _repository;

  StoreProvider(this._repository);

  List<StoreModel> _stores = [];
  bool _isLoading = false;

  List<StoreModel> get stores => _stores;
  bool get isLoading => _isLoading;

  Future<void> fetchStores() async {
    _isLoading = true;
    notifyListeners();

    try {
      _stores = await _repository.getStores();
      for (var store in _stores) {
        debugPrint('Fetched Store ID: ${store.id}');
      }
    } catch (e) {
      debugPrint('Error fetching stores: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategories(int storeId) async {
    debugPrint("Fetching categories for store $storeId");
  }
}
