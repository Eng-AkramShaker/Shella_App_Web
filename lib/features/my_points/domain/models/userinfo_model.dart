class User_Model {
  final int? id;
  final String? fName;
  final String? lName;
  final int? loyaltyPoint;

  User_Model({
    this.id,
    this.fName,
    this.lName,
    this.loyaltyPoint,
  });

  User_Model copyWith({
    int? id,
    String? fName,
    String? lName,
    int? loyaltyPoint,
  }) {
    return User_Model(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      loyaltyPoint: loyaltyPoint ?? this.loyaltyPoint,
    );
  }

  factory User_Model.fromJson(Map<String, dynamic> json) {
    return User_Model(
      id: json['id'],
      fName: json['f_name'],
      lName: json['l_name'],
      loyaltyPoint: json['loyalty_point'],
    );
  }
}
