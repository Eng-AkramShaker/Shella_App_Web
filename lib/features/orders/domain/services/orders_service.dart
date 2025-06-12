//
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shella_design/common/models/response_model.dart';
import 'package:shella_design/features/orders/domain/repositories/orders_repository_interface.dart';
import 'package:shella_design/features/orders/domain/services/orders_service_interface.dart';

class OrdersService implements OrdersServiceInterface {
  final OrdersRepositoryInterface ordersRepositoryInterface;

  OrdersService({required this.ordersRepositoryInterface});

  @override
  Future<ResponseModel> getRunningOrdersService() async {
    http.Response? response =
        await ordersRepositoryInterface.getRunningOrders();
    if (response != null) {
      if (response.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
        // await _updateHeaderFunctionality(authResponse, alreadyInApp: false);
        return ResponseModel(
          true,
          responsemap["message"],
        );
      } else {
        return ResponseModel(false, 'error ${response.statusCode}');
      }
    } else {
      return ResponseModel(false, 'error null}');
    }
  }

  @override
  Future<ResponseModel> getRunningHistoryService() async {
    http.Response? response =
        await ordersRepositoryInterface.getHistoryOrders();
    if (response != null) {
      if (response.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
        return ResponseModel(
          true,
          responsemap["message"],
        );
      } else {
        return ResponseModel(false, 'error ${response.statusCode}');
      }
    } else {
      return ResponseModel(false, 'error null}');
    }
  }
}
