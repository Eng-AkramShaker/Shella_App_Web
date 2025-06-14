import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/orders/domain/models/orders_model.dart';
import 'package:shella_design/features/orders/domain/services/orders_service_interface.dart';

enum OrderState { initial, loading, success, error }

class OrdersController with ChangeNotifier {
  final OrdersServiceInterface? ordersServiceInterface;

  OrdersController({this.ordersServiceInterface});

  static OrdersController get(context, {listen = true}) =>
      Provider.of<OrdersController>(context, listen: listen);

  /// GET STATE
  OrderState _runningOrdersstate = OrderState.initial;
  OrderState get runningOrdersstate => _runningOrdersstate;
  OrderState _historyOrdersstate = OrderState.initial;
  OrderState get historyOrdersstate => _historyOrdersstate;

  /// GET Orders
  PaginatedOrderModel? runningOrders;
  PaginatedOrderModel? historyOrders;

  ///-------------------------------------<<<---APIs--->>>-------------------------------------

  /// GET Orders

  getrunningOrders() async {
    try {
      _runningOrdersstate = OrderState.loading;

      notifyListeners();
      runningOrders = await ordersServiceInterface!.getRunningOrdersService(1);
      _runningOrdersstate = OrderState.success;
      print("runningOrders==========");

      print(runningOrders!.orders!.length);
      notifyListeners();
    } catch (e) {
      _runningOrdersstate = OrderState.error;
      notifyListeners();
    }
  }

  getHistoryOrders() async {
    try {
      _historyOrdersstate = OrderState.loading;

      notifyListeners();
      historyOrders = await ordersServiceInterface!.getRunningHistoryService(1);
      _historyOrdersstate = OrderState.success;
      print("historyOrders==========");

      print(historyOrders!.orders!.length);
      notifyListeners();
    } catch (e) {
      _historyOrdersstate = OrderState.error;
      notifyListeners();
    }
  }
}
