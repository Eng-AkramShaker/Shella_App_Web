import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import '../../../../../common/helper/check_Logged.dart';
import '../../../../../common/widgets/print/custom_print.dart';
import '../searchRepositoryInterface/search_repository_interface.dart';

class SearchRepository implements SearchRepositoryInterface {
  ///-------------------------------------<<<---SEARCH ITEMS--->>>-------------------------------------
  @override
  Future<http.Response?> searchItems({value}) async {
    Response? response =
        await ApiClient(sharedPreferences: sp<SharedPreferences>()).getData(ApiConstants.searchItems, query: {'name': value});
    customPrint('Search Items Response :: ${jsonDecode(response.body)}');
    return response;
  }

  ///-------------------------------------<<<---MOST SEARCHED--->>>-------------------------------------
  @override
  Future<http.Response?> mostSearched() async {
    Response? response = await ApiClient(sharedPreferences: sp<SharedPreferences>()).getData(ApiConstants.mostSearched);
    customPrint('Most Searched Response :: ${jsonDecode(response.body)}');
    return response;
  }

  ///-------------------------------------<<<---CART PRODUCTS--->>>-------------------------------------
  @override
  Future<http.Response?> cartProducts() async {
    Response? response = await ApiClient(sharedPreferences: sp<SharedPreferences>())
        .getData(ApiConstants.cartProducts, query: {'guest_id': sp<SharedPreferences>().getString(ApiConstants.guestId) ?? ''});
    customPrint('Cart Products Response :: ${jsonDecode(response.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET ADDRESS--->>>-------------------------------------
  @override
  Future<http.Response?> getAddress() async {
    Response? response = await ApiClient(sharedPreferences: sp<SharedPreferences>()).getData(ApiConstants.getAddress);
    customPrint('Get Address Response :: ${jsonDecode(response.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET ALL CATEGORIES--->>>-------------------------------------
  @override
  Future<http.Response?> getAllCategories() async {
    Response? response = await ApiClient(sharedPreferences: sp<SharedPreferences>()).getData(ApiConstants.getAllCategories);
    customPrint('Get All Categories Response :: ${jsonDecode(response.body)}');
    return response;
  }
}
