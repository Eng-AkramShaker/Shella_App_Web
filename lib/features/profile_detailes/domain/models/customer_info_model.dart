
class CustomerModel {
  final int id;
  final String fName;
  final String lName;
  final String phone;
  final String email;
  final String image;
  final bool isPhoneVerified;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String? firebaseToken;
  final int status;
  final int orderCount;
  final String loginMedium;
  final String? socialId;
  final int zoneId;
  final double walletBalance;
  final int loyaltyPoint;
  final String refCode;
  final String languageKey;
  final String? refBy;
  final String? tempToken;
  //final List<String> moduleIds;
  final bool isEmailVerified;
  final bool isFromPos;
  final String fullName;
  final String imageFullUrl;

  CustomerModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.email,
    required this.image,
    required this.isPhoneVerified,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.firebaseToken,
    required this.status,
    required this.orderCount,
    required this.loginMedium,
    required this.socialId,
    required this.zoneId,
    required this.walletBalance,
    required this.loyaltyPoint,
    required this.refCode,
    required this.languageKey,
    required this.refBy,
    required this.tempToken,
    //required this.moduleIds,
    required this.isEmailVerified,
    required this.isFromPos,
    required this.fullName,
    required this.imageFullUrl,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      fName: json['f_name'],
      lName: json['l_name'],
      phone: json['phone'],
      email: json['email'],
      image: json['image'],
      isPhoneVerified: json['is_phone_verified'] == 1,
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      firebaseToken: json['cm_firebase_token'],
      status: json['status'],
      orderCount: json['order_count'],
      loginMedium: json['login_medium'],
      socialId: json['social_id'],
      zoneId: json['zone_id'],
      walletBalance: (json['wallet_balance'] as num).toDouble(),
      loyaltyPoint: json['loyalty_point'],
      refCode: json['ref_code'],
      languageKey: json['current_language_key'],
      refBy: json['ref_by'],
      tempToken: json['temp_token'],
      isEmailVerified: json['is_email_verified'] == 1,
      isFromPos: json['is_from_pos'] == 1,
      fullName: json['full_name'],
      imageFullUrl: json['image_full_url'],
    );
  }
}