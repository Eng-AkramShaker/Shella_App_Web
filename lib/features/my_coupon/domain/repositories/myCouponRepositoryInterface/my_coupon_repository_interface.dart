import 'package:http/http.dart' as http;

abstract class MyCouponRepositoryInterface{

  Future<http.Response?> getMyCoupon();
  Future<http.Response?> applyCoupon({code,storeId});

}