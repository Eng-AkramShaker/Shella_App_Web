import 'package:shella_design/common/models/response_model.dart';

abstract class BalanceServiceInterface {
  Future<ResponseModel> addFund(
      {required String amount, required String paymentMethod});
}
