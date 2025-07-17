import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/home/domain/models/banner_model.dart';
import 'package:shella_design/features/home/domain/services/banner_service.dart';

class BannerProvider extends ChangeNotifier {
  final BannerService _bannerService;

  BannerProvider(this._bannerService);

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
      _banners = await _bannerService.fetchBanners();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
