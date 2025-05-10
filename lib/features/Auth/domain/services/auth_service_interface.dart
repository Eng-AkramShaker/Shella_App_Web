import '../../../../common/models/response_model.dart';
import '../models/signup_body_model.dart';

abstract class AuthServiceInterface {
  Future<ResponseModel> login({required String emailOrPhone, required String password, required String loginType, required String fieldType, bool alreadyInApp = false});
  Future<ResponseModel> registration(SignUpBodyModel signUpBody);

}
