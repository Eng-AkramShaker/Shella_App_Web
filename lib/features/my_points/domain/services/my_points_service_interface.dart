import 'package:shella_design/features/my_points/domain/models/my_coupons_model.dart';
import 'package:shella_design/features/my_points/domain/models/transaction_model.dart';
import 'package:shella_design/features/my_points/domain/models/userinfo_model.dart';

abstract class MyPointsServiceInterface {
  Future<User_Model> fetchUserProfile();
  Future<void> convertPoints(int points);
  Future<TransactionModel?> getTransactions(String offset);
  Future<List<CouponModel>> getCouponsList();
}
