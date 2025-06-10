import 'package:http/http.dart' as http;

abstract class HomeRepositoryInterface {

  Future<http.Response?> getHomeCategories();
  Future<http.Response?> getHomeBanners();

}