import 'package:shella_design/features/orders/domain/models/orders_model.dart';

abstract class OrdersServiceInterface {
  Future<PaginatedOrderModel> getRunningOrdersService(int offset);
  Future<PaginatedOrderModel> getRunningHistoryService(int offset);
}
