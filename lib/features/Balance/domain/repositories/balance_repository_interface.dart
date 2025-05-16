import 'package:http/http.dart' as http;

abstract class BalanceRepositoryInterface {
  Future<http.Response?> addFund(
      {required String amount, required String paymentMethod});
}
