import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../common/models/response_model.dart';
import '../domain/models/login_model.dart';
import '../domain/models/signup_body_model.dart';
import '../domain/services/auth_service_interface.dart';

enum AuthState { initial, loading, success, error }

class AuthController extends ChangeNotifier {
  final AuthServiceInterface authServiceInterface;

  AuthController({required this.authServiceInterface});

  AuthState _state = AuthState.initial;
  AuthState get state => _state;

  User? _user;
  User? get user => _user;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  String? _phone;
  String? get phone => _phone;
  set setphone(String? value) {
    _phone = value;
  }

  Future<ResponseModel> login(
      {required String emailOrPhone,
      required String password,
      required String loginType,
      required String fieldType,
      bool alreadyInApp = false}) async {
    ResponseModel? responseModel;
    _state = AuthState.loading;
    notifyListeners();

    try {
      responseModel = await authServiceInterface.login(
          emailOrPhone: emailOrPhone,
          password: password,
          loginType: loginType,
          fieldType: fieldType,
          alreadyInApp: alreadyInApp);
      if (responseModel.isSuccess && responseModel.authResponseModel != null) {
        _user = User(
          token: responseModel.authResponseModel!.token ?? '',
          isPhoneVerified:
              responseModel.authResponseModel!.isPhoneVerified ?? false,
        );
      }
      _state = AuthState.success;
      notifyListeners();
    } catch (e) {
      responseModel = ResponseModel(false, _errorMessage);
      _errorMessage = e.toString();
      _state = AuthState.error;
      notifyListeners();
    }
    return responseModel;
  }

  Future<ResponseModel> registration(SignUpBodyModel signUpBody) async {
    ResponseModel? responseModel;
    _state = AuthState.loading;
    notifyListeners();
    try {
      responseModel = await authServiceInterface.registration(signUpBody);
      _state = AuthState.success;
      notifyListeners();
    } catch (error) {
      responseModel = ResponseModel(false, 'error');
      log(error.toString());
    }
    return responseModel;
  }

  AuthState _verificationstate = AuthState.initial;
  AuthState get verificationstate => _verificationstate;

  String _verificationCode = '';
  String get verificationCode => _verificationCode;

  void updateVerificationCode(String query, {bool canUpdate = true}) {
    _verificationCode = query;
    if (canUpdate) {
      notifyListeners();
    }
  }

  Future<ResponseModel> forgetPassword(String? phone) async {
    _verificationstate = AuthState.loading;
    _phone = phone;
    ResponseModel? responseModel;
    notifyListeners();
    try {
      responseModel = await authServiceInterface.forgetPassword(phone);
      _verificationstate = AuthState.success;
      notifyListeners();
    } catch (error) {
      responseModel = ResponseModel(false, 'error');
      _verificationstate = AuthState.error;
      notifyListeners();
      log(error.toString());
    }

    return responseModel;
  }

  Future<ResponseModel> resetPassword(String? resetToken, String number,
      String password, String confirmPassword) async {
    _verificationstate = AuthState.loading;
    notifyListeners();
    ResponseModel? responseModel;

    try {
      responseModel = await authServiceInterface.resetPassword(
          resetToken, number, password, confirmPassword);
      _verificationstate = AuthState.success;
      notifyListeners();
    } catch (error) {
      responseModel = ResponseModel(false, 'error');
      _verificationstate = AuthState.error;
      notifyListeners();
      log(error.toString());
    }

    return responseModel;
  }

  Future<ResponseModel> verifyPhone(String phone, String otp) async {
    _verificationstate = AuthState.loading;
    notifyListeners();
    ResponseModel? responseModel;
    debugPrint("\x1B[32m  /$otp   $phone  \x1B[0m");
    try {
      responseModel = await authServiceInterface.verifyPhone(phone, otp);
      _verificationstate = AuthState.success;
      notifyListeners();
    } catch (error) {
      responseModel = ResponseModel(false, 'error');
      _verificationstate = AuthState.error;
      notifyListeners();
      log(error.toString());
    }

    return responseModel;
  }

  void resetState() {
    _state = AuthState.initial;
    _user = null;
    _errorMessage = null;
    notifyListeners();
  }
}
