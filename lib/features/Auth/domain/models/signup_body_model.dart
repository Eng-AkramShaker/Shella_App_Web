class SignUpBodyModel {
  String? name;
  String? phone;
  String? email;
  String? password;


  SignUpBodyModel({
    this.name,
    this.phone,
    this.email = '',
    this.password,

  });

  SignUpBodyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
