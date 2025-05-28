import 'package:http/http.dart' as http;

abstract class DiscountRepositoryInterface {

  Future<http.Response?> fetchDiscountedProducts({offset});

}