import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import '../../../../../common/helper/check_Logged.dart';
import '../../../../../common/util/Api_constants.dart';
import '../../../../../common/widgets/print/custom_print.dart';
import '../searchRepositoryInterface/search_repository_interface.dart';

class SearchRepository implements SearchRepositoryInterface{

  ///-------------------------------------<<<---SEARCH ITEMS--->>>-------------------------------------
  @override
  Future<http.Response?> searchItems({value}) async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.searchItems,query: {'name': value});
    customPrint('Search Items Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---MOST SEARCHED--->>>-------------------------------------
  @override
  Future<http.Response?> mostSearched() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.mostSearched);
    customPrint('Most Searched Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---CART PRODUCTS--->>>-------------------------------------
  @override
  Future<http.Response?> cartProducts() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.cartProducts,query: {'guest_id': sp<SharedPreferences>().getString(Api_Constants.guestId)??''});
    customPrint('Cart Products Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET ADDRESS--->>>-------------------------------------
  @override
  Future<http.Response?> getAddress() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.getAddress);
    customPrint('Get Address Response :: ${jsonDecode(response!.body)}');
    return response;
  }


}