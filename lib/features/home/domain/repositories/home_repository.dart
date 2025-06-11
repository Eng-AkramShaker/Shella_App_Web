import 'dart:convert';

import 'package:http/src/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../api/api_client.dart';
import '../../../../common/helper/check_Logged.dart';
import '../../../../common/util/Api_constants.dart';
import '../../../../common/widgets/print/custom_print.dart';
import 'home_repository_interface.dart';

class HomeRepository extends HomeRepositoryInterface {

  ///-------------------------------------<<<---GET HOME CATEGORIES--->>>-------------------------------------
  @override
  Future<Response?> getHomeCategories() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>(),zoneId: false).getData(Api_Constants.homeCategories);
    customPrint('Get Home Categories Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET HOME BANNERS--->>>-------------------------------------
  @override
  Future<Response?> getHomeBanners() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.homeBanners);
    customPrint('Get Home Banners Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET POPULAR STORES--->>>-------------------------------------
  @override
  Future<Response?> getPopularStores({String? type}) async {
    customPrint('TYPE =====>> $type');
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.popularStores,query: {'type': type??'all'});
    customPrint('Get Popular Stores Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET STORES--->>>-------------------------------------
  @override
  Future<Response?> getStores({String? featured}) async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.getStores,query: {'featured': featured??'1'});
    customPrint('Get Stores Response :: ${jsonDecode(response!.body)}');
    return response;
  }

}