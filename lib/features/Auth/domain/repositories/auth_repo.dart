// ignore_for_file: file_names

import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/app_constants.dart';

import 'package:shella_design/features/Auth/domain/models/signup_body_model.dart';
import 'package:shella_design/features/Auth/domain/repositories/auth_repository_interface.dart';
import 'package:shella_design/common/util/Api_constants.dart';

import '../../../../api/api_client.dart';
import '../../../../common/util/sharedPre_constants.dart';

import 'package:http/http.dart' as http;

class AuthRepo implements AuthRepositoryInterface {
  final ApiClient apiClient;
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
      MainAppConstants.emailOrPhone: "+966$emailOrPhone",
      MainAppConstants.password: password,
      MainAppConstants.loginType: loginType,
      MainAppConstants.fieldType: fieldType,
    };
    log(data.toString());
    if (guestId.isNotEmpty) {
      data.addAll({MainAppConstants.guestId: guestId});
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
    return await sharedPreferences.setString(SharedPrefKeys.userToken, token);
  }

  @override
  Future<http.Response?> registration(SignUpBodyModel signUpBody) async {
    return await apiClient.postData(Api_Constants.signup, signUpBody.toJson());
  }

  @override
  Future<http.Response?> forgetPassword(String? phone) async {
    // String? token = sharedPreferences.getString(SharedPrefKeys.userToken);
    var data = {
      MainAppConstants.phone: phone,
      // "cm_firebase_token": token!,
    };
    http.Response response =
        await apiClient.postData(Api_Constants.forgetPasswordUri, data);
    return response;
  }

  @override
  Future<http.Response?> resetPassword(String? resetToken, String number,
      String password, String confirmPassword) async {
    var data = {
      MainAppConstants.method: "put",
      MainAppConstants.resetTocken: resetToken,
      MainAppConstants.phone: number,
      MainAppConstants.password: password,
      MainAppConstants.confirmPassword: confirmPassword
    };
    http.Response response =
        await apiClient.postData(Api_Constants.resetPasswordUri, data);
    return response;
  }

  @override
  Future<http.Response?> verifyPhone(String? phone, String? otp) async {
    Map<String, dynamic> data = {
      MainAppConstants.phone: phone,
      MainAppConstants.otp: otp,
    };
    http.Response response =
        await apiClient.postData(Api_Constants.verifyPhoneUri, data);

    return response;
  }
}
