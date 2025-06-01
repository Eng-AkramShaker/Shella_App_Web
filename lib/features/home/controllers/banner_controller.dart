import 'package:flutter/material.dart';
import 'package:shella_design/features/home/domain/models/banner_model.dart';
import 'package:shella_design/features/home/domain/repositories/home_repository.dart';

class BannerProvider extends ChangeNotifier {
  final HomeRepository _repository;

  BannerProvider(this._repository);

  List<BannerModel> _banners = [];
  List<BannerModel> get banners => _banners;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadBanners() async {
    _isLoading = true;
    notifyListeners();

    try {
      _banners = await _repository.getBanners();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
