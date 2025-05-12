import 'package:shella_design/features/splash/domain/models/config_model.dart';
import 'package:shella_design/features/splash/domain/repositories/splash_repository_interface.dart';
import 'package:shella_design/features/splash/domain/services/splash_service_interface.dart';

class SplashService implements SplashServiceInterface {
  final SplashRepositoryInterface splashRepositoryInterface;
  SplashService({required this.splashRepositoryInterface});

  @override
  Future<ConfigModel> getConfigData() async {
    ConfigModel configModel = await splashRepositoryInterface.getConfigData();
    return configModel;
  }
}
