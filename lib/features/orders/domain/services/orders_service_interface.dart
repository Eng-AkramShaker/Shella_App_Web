import '../../../../common/models/response_model.dart';

abstract class OrdersServiceInterface {
  Future<ResponseModel> getRunningOrdersService();
  Future<ResponseModel> getRunningHistoryService();
}
