import 'package:http/http.dart' as http;

abstract class MyCouponRepositoryInterface{

  Future<http.Response?> getMyCoupon();

}