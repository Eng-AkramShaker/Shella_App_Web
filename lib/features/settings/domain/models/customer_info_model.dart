class CustomerModel {
  final int? id;
  final String? fName;
  final String? lName;
  final String? phone;
  final String? email;
  late final String? image;
  final bool? isPhoneVerified;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? firebaseToken;
  final int? status;
  final int? orderCount;
  final String? loginMedium;
  final String? socialId;
  final int? zoneId;
  final double? walletBalance;
  final int? loyaltyPoint;
  final String? refCode;
  final String? languageKey;
  final String? refBy;
  final String? tempToken;

  //final List<String>? moduleIds;
  final bool? isEmailVerified;
  final bool? isFromPos;
  final String? fullName;
  late final String? imageFullUrl;

  String? get safeImageFullUrl {
    if (imageFullUrl == null || imageFullUrl!.isEmpty) return null;

    return imageFullUrl;
  }

  CustomerModel({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.image,
    this.isPhoneVerified,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.firebaseToken,
    this.status,
    this.orderCount,
    this.loginMedium,
    this.socialId,
    this.zoneId,
    this.walletBalance,
    this.loyaltyPoint,
    this.refCode,
    this.languageKey,
    this.refBy,
    this.tempToken,
    //this.moduleIds,
    this.isEmailVerified,
    this.isFromPos,
    this.fullName,
    this.imageFullUrl,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      fName: json['f_name'],
      lName: json['l_name'],
      phone: json['phone'],
      email: json['email'],
      image: json['image'],
      isPhoneVerified: json['is_phone_verified'] != null
          ? json['is_phone_verified'] == 1
          : null,
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      firebaseToken: json['cm_firebase_token'],
      status: json['status'],
      orderCount: json['order_count'],
      loginMedium: json['login_medium'],
      socialId: json['social_id'],
      zoneId: json['zone_id'],
      walletBalance: json['wallet_balance'] != null
          ? (json['wallet_balance'] as num).toDouble()
          : null,
      loyaltyPoint: json['loyalty_point'],
      refCode: json['ref_code'],
      languageKey: json['current_language_key'],
      refBy: json['ref_by'],
      tempToken: json['temp_token'],
      isEmailVerified: json['is_email_verified'] != null
          ? json['is_email_verified'] == 1
          : null,
      isFromPos: json['is_from_pos'] != null ? json['is_from_pos'] == 1 : null,
      fullName: json['full_name'],
      imageFullUrl: json['image_full_url'],
    );
  }
}