import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/my_coupon/domain/models/my_coupon_models.dart';
import 'package:shella_design/features/my_coupon/domain/services/my_coupon_service_interface.dart';

enum MyCouponState {initial,loading,success,error}

class MyCouponController with ChangeNotifier {

  final MyCouponServiceInterface? myCouponServiceInterface;

  MyCouponController({this.myCouponServiceInterface});

  static MyCouponController get(context, {listen=true}) => Provider.of<MyCouponController>(context,listen: listen);

  /// GET STATE
  MyCouponState _state = MyCouponState.initial;
  MyCouponState _applySate = MyCouponState.initial;
  MyCouponState get state => _state;
  MyCouponState get applyCouponState => _applySate;


  /// GET AVAILABLE COUPON
  List<MyCouponModel>?  availableCoupons;
  List<MyCouponModel>?  unAvailableCoupons;
  getAvailableCoupons() {
    availableCoupons = myCouponModel!.where((element) => (DateTime.now().isAfter(DateTime.parse(element.expireDate!))==false)).toList();
    unAvailableCoupons = myCouponModel!.where((element) => (DateTime.now().isAfter(DateTime.parse(element.expireDate!))==true)).toList();
    notifyListeners();
  }
  ///-------------------------------------<<<---APIs--->>>-------------------------------------

  /// GET MY COUPON
  List<MyCouponModel>? myCouponModel;
  getMyCoupon() async {
    try{
      _state = MyCouponState.loading;
      myCouponModel=null;
      notifyListeners();
      myCouponModel = await myCouponServiceInterface!.getMyCoupon();
      _state = MyCouponState.success;
      getAvailableCoupons();
      notifyListeners();
    }catch(e){
      _state = MyCouponState.error;
      notifyListeners();
    }
  }

  /// APPLY COUPON
  applyCoupon({code,storeId}) async {
    try{
      _applySate = MyCouponState.loading;
      notifyListeners();
      customPrint('CODE ::: $code');
      customPrint('STORE ID ::: $storeId');
      await myCouponServiceInterface!.applyCoupon(code: code,storeId: storeId);
      _applySate = MyCouponState.success;
      getMyCoupon();
      notifyListeners();
    }catch(e){
      _applySate = MyCouponState.error;
      notifyListeners();
    }
  }
}