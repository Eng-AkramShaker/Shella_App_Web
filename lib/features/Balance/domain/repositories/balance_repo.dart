import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/Balance/domain/repositories/balance_repository_interface.dart';

class BalanceRepo implements BalanceRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  BalanceRepo({required this.apiClient, required this.sharedPreferences});

  @override
  Future<http.Response?> addFund(
      {required String amount, required String paymentMethod}) async {
    Map<String, dynamic> data = {
      "amount": amount,
      "payment_method": paymentMethod,
    };
    return await apiClient.postData(Api_Constants.addFund, data);
  }
}
