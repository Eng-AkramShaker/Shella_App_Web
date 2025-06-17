import 'package:shella_design/features/my_coupon/domain/models/my_coupon_models.dart';

abstract class MyCouponServiceInterface{

  Future<List<MyCouponModel>> getMyCoupon();
  Future<void> applyCoupon({code,storeId});

}