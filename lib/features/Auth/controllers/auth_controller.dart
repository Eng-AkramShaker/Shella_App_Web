import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../common/models/response_model.dart';
import '../domain/models/login_model.dart';
import '../domain/models/signup_body_model.dart';
import '../domain/services/auth_service_interface.dart';

enum AuthState { initial, loading, success, error }

class AuthController extends ChangeNotifier {
  final AuthServiceInterface? authServiceInterface;

  AuthController({this.authServiceInterface});

  AuthState _state = AuthState.initial;
  AuthState get state => _state;

  User? _user;
  User? get user => _user;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

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
      responseModel = await authServiceInterface!.login(
          emailOrPhone: emailOrPhone, password: password, loginType: loginType, fieldType: fieldType, alreadyInApp: alreadyInApp);
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
      responseModel = await authServiceInterface!.registration(signUpBody);
      _state = AuthState.success;
      notifyListeners();
    } catch (error) {
      responseModel = ResponseModel(false, 'error');
      log(error.toString());
    }
    return responseModel;
  }

  // SignupState _signupState = SignupState.initial;
  // SignupState get signupState => _signupState;
  //
  // Future<ResponseModel> registration(SignUpBodyModel signUpBody) async {
  //   ResponseModel? responseModel;
  //   _signupState = SignupState.loading;
  //   notifyListeners();
  //
  //   try {
  //     responseModel = await authService.registrationExecute(signUpBody);
  //     _signupState = SignupState.success;
  //     notifyListeners();
  //   }catch (error){
  //     _errorMessage = error.toString();
  //     _signupState = SignupState.error;
  //     notifyListeners();
  //   }
  //   return responseModel??ResponseModel(false, 'error null');
  // }

  void resetState() {
    _state = AuthState.initial;
    _user = null;
    _errorMessage = null;
    notifyListeners();
  }
}
