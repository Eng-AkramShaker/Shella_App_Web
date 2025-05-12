import 'package:shella_design/features/splash/domain/models/config_model.dart';

abstract class SplashRepositoryInterface {
  Future<ConfigModel> getConfigData();
}
