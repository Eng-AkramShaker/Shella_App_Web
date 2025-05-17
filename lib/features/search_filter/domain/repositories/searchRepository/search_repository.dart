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


}