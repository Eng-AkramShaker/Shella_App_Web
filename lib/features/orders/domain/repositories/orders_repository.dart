// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/orders/domain/repositories/orders_repository_interface.dart';

import '../../../../api/api_client.dart';
import 'package:http/http.dart' as http;

class OrdersRepository implements OrdersRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  OrdersRepository({required this.sharedPreferences, required this.apiClient});

  @override
  Future<http.Response?> getRunningOrders(int offset) async {
    http.Response response = await apiClient.getData('${ApiConstants.runningOrderListUri}?offset=$offset&limit=10');
    return response;
  }

  @override
  Future<http.Response?> getHistoryOrders(int offset) async {
    http.Response response = await apiClient.getData('${ApiConstants.historyOrderListUri}?offset=$offset&limit=10');

    return response;
  }
}
