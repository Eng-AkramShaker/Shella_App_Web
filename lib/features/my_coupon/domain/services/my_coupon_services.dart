import 'dart:convert';
import 'package:http/http.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/my_coupon/domain/models/my_coupon_models.dart';
import 'package:shella_design/features/my_coupon/domain/repositories/myCouponRepositoryInterface/my_coupon_repository_interface.dart';
import 'package:shella_design/features/my_coupon/domain/services/my_coupon_service_interface.dart';

class MyCouponServices implements MyCouponServiceInterface{

  final MyCouponRepositoryInterface myCouponRepositoryInterface;
  MyCouponServices({required this.myCouponRepositoryInterface});

  ///-------------------------------------<<<---GET MY COUPON--->>>-------------------------------------
  @override
  Future<List<MyCouponModel>> getMyCoupon({value}) async {
    try{
      Response? response = await myCouponRepositoryInterface.getMyCoupon();
      if(response!.statusCode==200){
        return (jsonDecode(response.body) as List).map((e) => MyCouponModel.fromJson(e)).toList();
      }else{
        throw Exception('Get My Coupon Failed');
      }
    }catch(e){
      customPrint('Get My Coupon Exception :: ${e.toString()}');
      throw Exception('Get My Coupon Exception :: ${e.toString()}');
    }
  }

  ///-------------------------------------<<<---APPLY COUPON--->>>-------------------------------------
  @override
  Future<void> applyCoupon({code,storeId}) async {
    try{
      Response? response = await myCouponRepositoryInterface.applyCoupon(code: code,storeId: storeId);
      if(response!.statusCode==200){
        return jsonDecode(response.body);
      }else{
        throw Exception('Apply Coupon Failed');
      }
    }catch(e){
      customPrint('Apply Coupon Exception :: ${e.toString()}');
      throw Exception('Apply Coupon Exception :: ${e.toString()}');
    }
  }

}