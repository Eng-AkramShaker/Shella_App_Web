import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shella_design/common/models/response_model.dart';
import 'package:shella_design/features/Auth/domain/models/auth_response_model.dart';
import 'package:shella_design/features/Auth/domain/models/signup_body_model.dart';
import 'package:shella_design/features/Auth/domain/services/auth_service_interface.dart';
import '../repositories/auth_repository_interface.dart';

class AuthService implements AuthServiceInterface {
  final AuthRepositoryInterface authRepositoryInterface;

  AuthService({required this.authRepositoryInterface});
  @override
  Future<ResponseModel> login(
      {required String emailOrPhone,
      required String password,
      required String loginType,
      required String fieldType,
      bool alreadyInApp = false}) async {
    http.Response? response = await authRepositoryInterface.login(
        emailOrPhone: emailOrPhone,
        password: password,
        loginType: loginType,
        fieldType: fieldType);
    if (response != null) {
      if (response.statusCode == 200) {
        AuthResponseModel authResponse =
            AuthResponseModel.fromJson(jsonDecode(response.body));
        await _updateHeaderFunctionality(authResponse,
            alreadyInApp: alreadyInApp);
        return ResponseModel(true, authResponse.token ?? '',
            authResponseModel: authResponse);
      } else {
        log('eerr');
        return ResponseModel(false, 'error');
      }
    } else {
      log('errrrrr');
      return ResponseModel(false, 'error');
    }
  }

  Future<void> _updateHeaderFunctionality(AuthResponseModel authResponse,
      {bool alreadyInApp = false}) async {
    log('message');
    await authRepositoryInterface.saveUserToken(authResponse.token ?? '',
        alreadyInApp: alreadyInApp);
    // if(authResponse.isEmailVerified! && authResponse.isPhoneVerified! && authResponse.isPersonalInfo! && authResponse.token != null && authResponse.isExistUser == null) {
    //   authRepositoryInterface.saveUserToken(authResponse.token??'', alreadyInApp: alreadyInApp);
    //   await authRepositoryInterface.updateToken();
    //   await authRepositoryInterface.clearSharedPrefGuestId();
    // }
  }

  @override
  Future<ResponseModel> registration(SignUpBodyModel signUpBody) async {
    http.Response? response =
        await authRepositoryInterface.registration(signUpBody);
    if (response != null) {
      if (response.statusCode == 200) {
        AuthResponseModel authResponse =
            AuthResponseModel.fromJson(jsonDecode(response.body));
        await _updateHeaderFunctionality(authResponse, alreadyInApp: false);
        return ResponseModel(true, authResponse.token ?? '',
            authResponseModel: authResponse);
      } else {
        return ResponseModel(false, 'error ${response.statusCode}');
      }
    } else {
      return ResponseModel(false, 'error null}');
    }
  }

  @override
  Future<ResponseModel> forgetPassword(String? phone) async {
    http.Response? response =
        await authRepositoryInterface.forgetPassword(phone);
    if (response != null) {
      if (response.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
        // await _updateHeaderFunctionality(authResponse, alreadyInApp: false);
        return ResponseModel(
          true,
          responsemap["message"],
        );
      } else {
        return ResponseModel(false, 'error ${response.statusCode}');
      }
    } else {
      return ResponseModel(false, 'error null}');
    }
  }

  @override
  Future<ResponseModel> resetPassword(String? resetToken, String number,
      String password, String confirmPassword) async {
    http.Response? response = await authRepositoryInterface.resetPassword(
        resetToken, number, password, confirmPassword);
    if (response != null) {
      if (response.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
        // await _updateHeaderFunctionality(authResponse, alreadyInApp: false);
        return ResponseModel(
          true,
          responsemap["message"],
        );
      } else {
        return ResponseModel(false, 'error ${response.statusCode}');
      }
    } else {
      return ResponseModel(false, 'error null}');
    }
  }

  @override
  Future<ResponseModel> verifyPhone(String? phone, String? otp) async {
    http.Response? response =
        await authRepositoryInterface.verifyPhone(phone, otp);
    if (response != null) {
      if (response.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
        // await _updateHeaderFunctionality(authResponse, alreadyInApp: false);
        return ResponseModel(
          true,
          responsemap["message"],
        );
      } else {
        return ResponseModel(false, 'error ${response.statusCode}');
      }
    } else {
      return ResponseModel(false, 'error null}');
    }
  }
}
