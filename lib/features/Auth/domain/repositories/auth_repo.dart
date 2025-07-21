// ignore_for_file: file_names

import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/Auth/domain/models/signup_body_model.dart';
import 'package:shella_design/features/Auth/domain/repositories/auth_repository_interface.dart';

import '../../../../api/api_client.dart';
import '../../../../common/util/sharedPre_constants.dart';
import 'package:http/http.dart' as http;

class AuthRepo implements AuthRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.sharedPreferences, required this.apiClient});

  @override
  Future<http.Response?> login(context,
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
    return await apiClient.postData(context, ApiConstants.login, data);
  }

  @override
  // ignore: override_on_non_overriding_member
  String getSharedPrefGuestId() {
    return sharedPreferences.getString(ApiConstants.guestId) ?? "";
  }

  @override
  Future<bool> clearSharedPrefGuestId() async {
    return await sharedPreferences.remove(ApiConstants.guestId);
  }

  @override
  Future<bool> saveUserToken(String token, {bool alreadyInApp = false}) async {
    return await sharedPreferences.setString(SharedPrefKeys.userToken, token);
  }

  @override
  Future<http.Response?> registration(SignUpBodyModel signUpBody) async {
    return await apiClient.postData(context, ApiConstants.signup, signUpBody.toJson());
  }

  @override
  Future<http.Response?> forgetPassword(String? phone) async {
    // String? token = sharedPreferences.getString(SharedPrefKeys.userToken);
    var data = {
      "phone": phone,
      // "cm_firebase_token": token!,
    };
    http.Response response = await apiClient.postData(context, ApiConstants.forgetPasswordUri, data);
    return response;
  }

  @override
  Future<http.Response?> resetPassword(String? resetToken, String number, String password, String confirmPassword) async {
    var data = {
      "_method": "put",
      "reset_token": resetToken,
      "phone": number,
      "password": password,
      "confirm_password": confirmPassword
    };
    http.Response response = await apiClient.postData(context, ApiConstants.resetPasswordUri, data);
    return response;
  }

  @override
  Future<http.Response?> verifyPhone(String? phone, String? otp) async {
    Map<String, dynamic> data = {
      'phone': phone,
      'otp': otp,
    };
    http.Response response = await apiClient.postData(context, ApiConstants.verifyPhoneUri, data);

    return response;
  }
}
