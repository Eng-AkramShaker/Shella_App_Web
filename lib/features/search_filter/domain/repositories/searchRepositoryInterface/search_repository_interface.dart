import 'package:http/http.dart' as http;

abstract class SearchRepositoryInterface{

  Future<http.Response?> searchItems({value});

  Future<http.Response?> mostSearched();

  Future<http.Response?> cartProducts();

  Future<http.Response?> getAddress();
}