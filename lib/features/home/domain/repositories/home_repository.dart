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
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.getHomeCategories);
    customPrint('Get Home Categories Response :: ${jsonDecode(response!.body)}');
    return response;
  }

}