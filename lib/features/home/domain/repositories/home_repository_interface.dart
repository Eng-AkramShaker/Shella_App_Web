import 'package:http/http.dart' as http;

abstract class HomeRepositoryInterface {

  Future<http.Response?> getHomeCategories();
  Future<http.Response?> getHomeBanners();
  Future<http.Response?> getPopularStores({String? type,String? moduleId});
  Future<http.Response?> getStores({String? moduleId});
  Future<http.Response?> getZones();

}