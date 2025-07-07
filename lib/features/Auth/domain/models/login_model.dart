class LoginRequest {
  final String phone;
  final String password;

  LoginRequest({required this.phone, required this.password});
}

class LoginResponse {
  final String token;
  final int isPhoneVerified;

  LoginResponse({required this.token, required this.isPhoneVerified});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      isPhoneVerified: json['is_phone_verified'],
    );
  }
}

class User {
  final String token;
  final bool isPhoneVerified;

  User({required this.token, required this.isPhoneVerified});
}