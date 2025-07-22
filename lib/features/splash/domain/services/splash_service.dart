import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/splash/domain/models/config_model.dart';
import 'package:shella_design/features/splash/domain/services/splash_service_interface.dart';

class SplashService implements SplashServiceInterface {
  //final SplashRepositoryInterface splashRepositoryInterface;
  SplashService(
      //required this.splashRepositoryInterface
      );

  // @override
  // Future<ConfigModel> getConfigData() async {
  //   ConfigModel configModel = await splashRepositoryInterface.getConfigData();
  //   return configModel;
  // }
  @override
  Future<ConfigModel> getConfig() async {
    final response = await http.get(
      Uri.parse(ApiConstants.configUri),
      headers: _headers,
    );
    if (response.statusCode == 200) {
      return ConfigModel.fromJson(json.decode(response.body));
    }
    throw Exception('Failed to load ConfigData: ${response.statusCode}');
  }

  Map<String, String> get _headers => {'Authorization': 'Bearer ${ApiConstants.token}'};
}
