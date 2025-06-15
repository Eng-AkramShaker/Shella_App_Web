class UserInfoModel {
  final int? id;
  final String? fName;
  final String? lName;
  final int? loyaltyPoint;

  UserInfoModel({
    this.id,
    this.fName,
    this.lName,
    this.loyaltyPoint,
  });

  UserInfoModel copyWith({
    int? id,
    String? fName,
    String? lName,
    int? loyaltyPoint,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      loyaltyPoint: loyaltyPoint ?? this.loyaltyPoint,
    );
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'],
      fName: json['f_name'],
      lName: json['l_name'],
      loyaltyPoint: json['loyalty_point'],
    );
  }
}