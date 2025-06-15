import 'package:http/http.dart' as http;

abstract class OrdersRepositoryInterface {
  Future<http.Response?> getRunningOrders(int offset);
  Future<http.Response?> getHistoryOrders(int offset);
}
