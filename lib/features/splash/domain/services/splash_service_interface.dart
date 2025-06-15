import 'package:shella_design/features/splash/domain/models/config_model.dart';

abstract class SplashServiceInterface {
  // Future<ConfigModel> getConfigData();
  // this one is temporary function until the Auth API is implemented
  Future<ConfigModel> getConfig();
}
