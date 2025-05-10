import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/util/sharedPre_constants.dart';
import 'package:shella_design/helper/shared_pref_helper.dart';
import 'package:shella_design/util/Api_constants.dart';

final sp = GetIt.instance;

Future<void> init() async {
  // Register SharedPreferences as a singleton that needs asynchronous initialization
  sp.registerSingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
  // Register ApiProvider, waiting for SharedPreferences to be available
  sp.registerSingleton<ApiProvider>(
    ApiProvider(
      appBaseUrl: Api_Constants.appBaseUrl,
      sharedPreferences: await sp.getAsync<SharedPreferences>(), // Use getAsync
    ),
  );
}

checkIfLoggedInUser() async {
  String userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken) ?? '';

  if (userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
