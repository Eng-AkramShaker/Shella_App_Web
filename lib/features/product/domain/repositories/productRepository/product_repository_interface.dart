import 'package:http/http.dart' as http;

abstract class ProductRepositoryInterface {

  Future<http.Response?> getStoreDetails({required String storeId});

}