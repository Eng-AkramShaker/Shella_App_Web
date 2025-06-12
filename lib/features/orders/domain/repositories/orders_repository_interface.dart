import 'package:http/http.dart' as http;

abstract class OrdersRepositoryInterface {
  Future<http.Response?> getRunningOrders();
  Future<http.Response?> getHistoryOrders();
}
