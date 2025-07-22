import 'dart:convert';
import 'package:http/src/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../api/api_client.dart';
import '../../../../../common/helper/check_Logged.dart';
import '../../../../../common/util/Api_constants.dart';
import '../../../../../common/widgets/print/custom_print.dart';
import '../myCouponRepositoryInterface/my_coupon_repository_interface.dart';

class MyCouponRepository implements MyCouponRepositoryInterface {
  ///-------------------------------------<<<---GET MY COUPON--->>>-------------------------------------
  @override
  Future<Response?> getMyCoupon() async {
    Response? response = await ApiClient(
            appBaseUrl: Api_Constants.appBaseUrl,
            sharedPreferences: sp<SharedPreferences>())
        .getData(Api_Constants.getMyCoupon);
    customPrint('Get My Coupon Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---APPLY COUPON--->>>-------------------------------------
  @override
  Future<Response?> applyCoupon({code, storeId}) async {
    Response? response = await ApiClient(
            appBaseUrl: Api_Constants.appBaseUrl,
            sharedPreferences: sp<SharedPreferences>())
        .getData(Api_Constants.applyCoupon,
            query: {'code': code, 'store_id': storeId.toString()});
    customPrint('Apply Coupon Response :: ${jsonDecode(response!.body)}');
    return response;
  }
}
