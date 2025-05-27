// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/features/splash/domain/models/config_model.dart';
import 'package:shella_design/features/splash/domain/services/splash_service_interface.dart';

class SplashController extends ChangeNotifier {
  final SplashServiceInterface? splashServiceInterface;
  final ApiClient? apiClient;

  SplashController({this.splashServiceInterface, this.apiClient});

  ConfigModel? _configModel;
  ConfigModel? get configModel => _configModel;

  // ===========================================================================

  Future<void> getConfigData(context) async {
    // getConfigData(context, loadModuleData: loadModuleData, loadLandingData: loadLandingData, source: DataSourceEnum.client);

    if (apiClient == null) {
      print("❌ خطأ: apiClient غير مهيأ");
      return;
    }

    final response = await apiClient!.getData(
        'https://shalafood.net/api/v1/config',
        forceRefreshToken: false);
  }
}
