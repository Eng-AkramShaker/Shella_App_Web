import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/orders/domain/models/orders_model.dart';
import 'package:shella_design/features/orders/domain/services/orders_service_interface.dart';

enum OrderState { initial, loading, success, error }

class OrdersController with ChangeNotifier {
  final OrdersServiceInterface? ordersServiceInterface;

  OrdersController({this.ordersServiceInterface});

  static OrdersController get(context, {listen = true}) => Provider.of<OrdersController>(context, listen: listen);

  /// STATE VARIABLES
  OrderState _runningOrdersstate = OrderState.initial;
  OrderState get runningOrdersstate => _runningOrdersstate;

  OrderState _historyOrdersstate = OrderState.initial;
  OrderState get historyOrdersstate => _historyOrdersstate;

  OrderState _scheduleOrdersstate = OrderState.initial;
  OrderState get scheduleOrdersstate => _scheduleOrdersstate;

  /// Load More States
  OrderState _loadMoreRunningState = OrderState.initial;
  OrderState get loadMoreRunningState => _loadMoreRunningState;

  OrderState _loadMoreHistoryState = OrderState.initial;
  OrderState get loadMoreHistoryState => _loadMoreHistoryState;

  OrderState _loadMoreScheduleState = OrderState.initial;
  OrderState get loadMoreScheduleState => _loadMoreScheduleState;

  /// Orders Data
  PaginatedOrderModel? runningOrders;
  PaginatedOrderModel? historyOrders;
  PaginatedOrderModel? scheduleOrders;

  ///-------------------------------------------<<<---APIs--->>>-------------------------------------------

  /// GET Running Orders
  Future<void> getrunningOrders() async {
    try {
      _runningOrdersstate = OrderState.loading;
      notifyListeners();

      PaginatedOrderModel lrunningOrders = await ordersServiceInterface!.getRunningOrdersService(1);
      runningOrders = PaginatedOrderModel(
        offset: lrunningOrders.offset,
        limit: lrunningOrders.limit,
        totalSize: lrunningOrders.totalSize,
        orders: [],
      );
      for (var item in lrunningOrders.orders!) {
        if (item.createdAt.toString() == item.scheduleAt.toString()) {
          runningOrders!.orders!.add(item);
        }
      }

      _runningOrdersstate = OrderState.success;
      notifyListeners();
    } catch (e) {
      _runningOrdersstate = OrderState.error;
      notifyListeners();
    }
  }

  /// GET History Orders
  Future<void> getHistoryOrders() async {
    try {
      _historyOrdersstate = OrderState.loading;
      notifyListeners();

      historyOrders = await ordersServiceInterface!.getRunningHistoryService(1);

      _historyOrdersstate = OrderState.success;
      notifyListeners();
    } catch (e) {
      _historyOrdersstate = OrderState.error;
      notifyListeners();
    }
  }

  /// GET Schedule Orders
  Future<void> getScheduleOrders() async {
    try {
      _scheduleOrdersstate = OrderState.loading;
      notifyListeners();

      PaginatedOrderModel lscheduleOrders = await ordersServiceInterface!.getRunningOrdersService(1);
      scheduleOrders = PaginatedOrderModel(
        offset: lscheduleOrders.offset,
        limit: lscheduleOrders.limit,
        totalSize: lscheduleOrders.totalSize,
        orders: [],
      );
      for (var item in lscheduleOrders.orders!) {
        if (item.createdAt.toString() != item.scheduleAt.toString()) {
          scheduleOrders!.orders!.add(item);
        }
      }

      _scheduleOrdersstate = OrderState.success;
      notifyListeners();
    } catch (e) {
      _scheduleOrdersstate = OrderState.error;
      notifyListeners();
    }
  }

  /// LOAD MORE Running Orders
  Future<void> loadMoreRunningOrders() async {
    if (_loadMoreRunningState == OrderState.loading || runningOrders == null) {
      return;
    }

    final currentLength = runningOrders!.orders?.length ?? 0;
    final total = runningOrders!.totalSize ?? 0;

    if (currentLength >= total) return;

    _loadMoreRunningState = OrderState.loading;
    notifyListeners();

    try {
      final nextPage = ((currentLength / int.parse(runningOrders!.limit!)).ceil()) + 1;
      final newData = await ordersServiceInterface!.getRunningOrdersService(nextPage);
      if (newData.orders != null && newData.orders!.isNotEmpty) {
        for (var item in newData.orders!) {
          if (item.createdAt.toString() == item.scheduleAt.toString()) {
            runningOrders!.orders ??= [];
            runningOrders!.orders!.add(item);
            runningOrders!.offset = newData.offset;
            runningOrders!.limit = newData.limit;
            runningOrders!.totalSize = newData.totalSize;
          }
        }
      }

      _loadMoreRunningState = OrderState.success;
      notifyListeners();
    } catch (e) {
      _loadMoreRunningState = OrderState.error;
      notifyListeners();
    }
  }

  /// LOAD MORE History Orders
  Future<void> loadMoreHistoryOrders() async {
    if (_loadMoreHistoryState == OrderState.loading || historyOrders == null) {
      return;
    }

    final currentLength = historyOrders!.orders?.length ?? 0;
    final total = historyOrders!.totalSize ?? 0;

    if (currentLength >= total) return;

    _loadMoreHistoryState = OrderState.loading;
    notifyListeners();

    try {
      final nextPage = ((currentLength / int.parse(historyOrders!.limit!)).ceil()) + 1;
      final newData = await ordersServiceInterface!.getRunningHistoryService(nextPage);

      if (newData.orders != null && newData.orders!.isNotEmpty) {
        historyOrders!.orders!.addAll(newData.orders!);
        historyOrders!.offset = newData.offset;
      }

      _loadMoreHistoryState = OrderState.success;
      notifyListeners();
    } catch (e) {
      _loadMoreHistoryState = OrderState.error;
      notifyListeners();
    }
  }

  /// LOAD MORE Schedule Orders
  Future<void> loadMoreScheduleOrders() async {
    if (_loadMoreScheduleState == OrderState.loading || scheduleOrders == null) {
      return;
    }

    final currentLength = scheduleOrders!.orders?.length ?? 0;
    final total = scheduleOrders!.totalSize ?? 0;

    if (currentLength >= total) return;

    _loadMoreScheduleState = OrderState.loading;
    notifyListeners();

    try {
      final nextPage = ((currentLength / int.parse(scheduleOrders!.limit!)).ceil()) + 1;
      final newData = await ordersServiceInterface!.getRunningOrdersService(nextPage);

      if (newData.orders != null && newData.orders!.isNotEmpty) {
        for (var item in newData.orders!) {
          if (item.createdAt.toString() != item.scheduleAt.toString()) {
            scheduleOrders!.orders ??= [];
            scheduleOrders!.orders!.add(item);
            scheduleOrders!.offset = newData.offset;
            scheduleOrders!.limit = newData.limit;
            scheduleOrders!.totalSize = newData.totalSize;
          }
        }
      }
      _loadMoreScheduleState = OrderState.success;
      notifyListeners();
    } catch (e) {
      _loadMoreScheduleState = OrderState.error;
      notifyListeners();
    }
  }
}
