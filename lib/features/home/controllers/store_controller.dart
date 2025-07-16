import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';
import 'package:shella_design/features/home/domain/services/store_service.dart';

class StoreProvider with ChangeNotifier {
  final StoreService _storeService;

  List<StoreModel> _stores = [];
  bool _isLoading = false;

  StoreProvider(this._storeService);

  List<StoreModel> get stores => _stores;
  bool get isLoading => _isLoading;

  Future<void> fetchStores() async {
    _isLoading = true;
    notifyListeners();

    try {
      _stores = await _storeService.fetchStores();
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
