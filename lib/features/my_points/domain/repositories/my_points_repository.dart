import 'package:http/src/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/helper/check_Logged.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/my_points/domain/repositories/my_points_repository_interface.dart';
import 'dart:convert';
class MyPointsRepository implements MyPointsRepositoryInterface{
  @override
  Future<Response?> convertPoints(int points) async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl, sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.pointsConversionUri);
    customPrint('Convert Points Response :: ${jsonDecode(response.body)}');
    return response;
  }

  @override
  Future<Response?> fetchUserProfile() async{
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl, sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.customerInfoUri);
    customPrint('Fetch User Profile Response :: ${jsonDecode(response.body)}');
    return response;
  }

  @override
  Future<Response?> getTransactions(String offset) async{
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl, sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.pointsTransactionsUri);
    customPrint('Get Points Transactions Response :: ${jsonDecode(response.body)}');
    return response;
  }

  @override
  Future<Response?> getCouponsList() async{
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl, sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.couponListUri);
    customPrint('Get Coupons Response :: ${jsonDecode(response.body)}');
    return response;
  }

}