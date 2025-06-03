import 'package:http/http.dart' as http;

abstract class MyPointsRepositoryInterface{
  Future<http.Response?> fetchUserProfile();
  Future<http.Response?> convertPoints(int points);
  Future<http.Response?> getTransactions(String offset);
  Future<http.Response?> getCouponsList();
}