import 'package:http/http.dart' as http;

import '../models/signup_body_model.dart';

abstract class AuthRepositoryInterface{
  Future<http.Response?> login({required String emailOrPhone, required String password, required String loginType, required String fieldType});
  Future<bool> saveUserToken(String token, {bool alreadyInApp = false});
  Future<bool> clearSharedPrefGuestId();
  Future<http.Response?> registration(SignUpBodyModel signUpBody);

}
