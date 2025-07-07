// ignore_for_file: override_on_non_overriding_member

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/features/splash/domain/models/config_model.dart';
import 'package:shella_design/features/splash/domain/repositories/splash_repository_interface.dart';

class SplashRepository implements SplashRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  SplashRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future<ConfigModel> getConfigData() async {
    ConfigModel? configModel;
    return configModel!;
  }
}
