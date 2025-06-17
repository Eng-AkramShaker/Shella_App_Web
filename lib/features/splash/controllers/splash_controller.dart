// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shella_design/features/splash/domain/models/config_model.dart';
import 'package:shella_design/features/splash/domain/services/splash_service.dart';

class SplashController extends ChangeNotifier {
  final SplashService splashService;
  //final ApiClient? apiClient;

  SplashController(this.splashService);

  ConfigModel? _configModel;
  ConfigModel? get configModel => _configModel;
  bool _loading = false;
  String? _error;
  bool get loading => _loading;
  String? get error => _error;

  DateTime get currentTime => DateTime.now();

  // ===========================================================================

  // Future<void> getConfigData(context) async {
  //   // getConfigData(context, loadModuleData: loadModuleData, loadLandingData: loadLandingData, source: DataSourceEnum.client);

  //   if (apiClient == null) {
  //     print("❌ خطأ: apiClient غير مهيأ");
  //     return;
  //   }

  //   final response = await apiClient!.getData('https://shalafood.net/api/v1/config');
  // }

  Future<void> loadConfig() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _configModel = await splashService.getConfig();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
