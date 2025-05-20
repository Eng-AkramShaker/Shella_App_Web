import 'package:flutter/material.dart';
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
      final zone2Stores = await _storeService.fetchStores(zoneId: 2);
      final zone5Stores = await _storeService.fetchStores(zoneId: 5);

      _stores = [...zone2Stores, ...zone5Stores];
    } catch (e) {
      debugPrint('Error fetching stores: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
