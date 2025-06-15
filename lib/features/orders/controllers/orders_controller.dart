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

  Future<void> loadMoreRunningOrders() async {
    if (_runningOrdersstate == OrderState.loading || runningOrders == null)
      return;

    final currentLength = runningOrders!.orders?.length ?? 0;
    final total = runningOrders!.totalSize ?? 0;

    if (currentLength >= total) return; // No more data

    _runningOrdersstate = OrderState.loading;
    notifyListeners();

    try {
      final nextPage =
          ((currentLength / int.parse(runningOrders!.limit!)).ceil()) + 1;
      final newData =
          await ordersServiceInterface!.getRunningOrdersService(nextPage);

      if (newData.orders != null && newData.orders!.isNotEmpty) {
        runningOrders!.orders!.addAll(newData.orders!);
        runningOrders!.offset = newData.offset;
      }

      _runningOrdersstate = OrderState.success;
      notifyListeners();
    } catch (e) {
      _runningOrdersstate = OrderState.error;
      notifyListeners();
    }
  }

  Future<void> loadMoreHistoryOrders() async {
    if (_historyOrdersstate == OrderState.loading || historyOrders == null)
      return;

    final currentLength = historyOrders!.orders?.length ?? 0;
    final total = historyOrders!.totalSize ?? 0;

    if (currentLength >= total) return; // No more data

    _historyOrdersstate = OrderState.loading;
    notifyListeners();

    try {
      final nextPage =
          ((currentLength / int.parse(historyOrders!.limit!)).ceil()) + 1;
      final newData =
          await ordersServiceInterface!.getRunningHistoryService(nextPage);

      if (newData.orders != null && newData.orders!.isNotEmpty) {
        historyOrders!.orders!.addAll(newData.orders!);
        historyOrders!.offset = newData.offset;
      }

      _historyOrdersstate = OrderState.success;
      notifyListeners();
    } catch (e) {
      _historyOrdersstate = OrderState.error;
      notifyListeners();
    }
  }
}
