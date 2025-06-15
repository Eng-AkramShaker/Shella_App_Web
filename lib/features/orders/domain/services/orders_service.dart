//
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shella_design/common/models/response_model.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/orders/domain/models/orders_model.dart';
import 'package:shella_design/features/orders/domain/repositories/orders_repository_interface.dart';
import 'package:shella_design/features/orders/domain/services/orders_service_interface.dart';

class OrdersService implements OrdersServiceInterface {
  final OrdersRepositoryInterface ordersRepositoryInterface;

  OrdersService({required this.ordersRepositoryInterface});

  @override
  Future<PaginatedOrderModel> getRunningOrdersService(int offset) async {
    try {
      http.Response? response =
          await ordersRepositoryInterface.getRunningOrders(offset);
      if (response!.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
        return PaginatedOrderModel.fromJson(responsemap);
      } else {
        throw Exception('Get My Orders Failed');
      }
    } catch (e) {
      customPrint('Get My Orders Exception :: ${e.toString()}');
      throw Exception('Get My Orders Exception :: ${e.toString()}');
    }
  }

  @override
  Future<PaginatedOrderModel> getRunningHistoryService(int offset) async {
    try {
      http.Response? response =
          await ordersRepositoryInterface.getHistoryOrders(offset);
      if (response!.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
        return PaginatedOrderModel.fromJson(responsemap);
      } else {
        throw Exception('Get My Orders Failed');
      }
    } catch (e) {
      customPrint('Get My Orders Exception :: ${e.toString()}');
      throw Exception('Get My Orders Exception :: ${e.toString()}');
    }
  }
}
