import 'package:http/http.dart' as http;

abstract class SearchRepositoryInterface{
  Future<http.Response?> searchItems({value});
}