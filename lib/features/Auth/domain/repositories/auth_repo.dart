// ignore_for_file: file_names

import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/features/Auth/domain/models/signup_body_model.dart';
import 'package:shella_design/features/Auth/domain/repositories/auth_repository_interface.dart';
import 'package:shella_design/util/Api_constants.dart';

import '../../../../api/api_client.dart';
import '../../../../util/sharedPre_constants.dart';
import 'package:http/http.dart' as http;

class AuthRepo implements AuthRepositoryInterface {
  final ApiProvider apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.sharedPreferences, required this.apiClient});

  @override
  Future<http.Response?> login(
      {required String emailOrPhone,
      required String password,
      required String loginType,
      required String fieldType,
      bool alreadyInApp = false}) async {
    String guestId = getSharedPrefGuestId();
    Map<String, String> data = {
      "email_or_phone": "+966$emailOrPhone",
      "password": password,
      "login_type": loginType,
      "field_type": fieldType,
    };
    log(data.toString());
    if (guestId.isNotEmpty) {
      data.addAll({"guest_id": guestId});
    }
    return await apiClient.postData(Api_Constants.login, data);
  }

  @override
  String getSharedPrefGuestId() {
    return sharedPreferences.getString(Api_Constants.guestId) ?? "";
  }

  @override
  Future<bool> clearSharedPrefGuestId() async {
    return await sharedPreferences.remove(Api_Constants.guestId);
  }

  @override
  Future<bool> saveUserToken(String token, {bool alreadyInApp = false}) async {
    //apiClient.token = token;
    // if(alreadyInApp && sharedPreferences.getString(AppConstants.userAddress) != null){
    //   AddressModel? addressModel = AddressModel.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.userAddress)!));
    //   apiClient.updateHeader(
    //     token, addressModel.zoneIds, addressModel.areaIds, sharedPreferences.getString(AppConstants.languageCode),
    //     ModuleHelper.getModule()?.id, addressModel.latitude, addressModel.longitude,
    //   );
    // }else{
    //   apiClient.updateHeader(token, null, null, sharedPreferences.getString(AppConstants.languageCode), ModuleHelper.getModule()?.id, null, null);
    // }
    return await sharedPreferences.setString(SharedPrefKeys.userToken, token);
  }

  @override
  Future<http.Response?> registration(SignUpBodyModel signUpBody) async {
    return await apiClient.postData(Api_Constants.signup, signUpBody.toJson());
  }
}
