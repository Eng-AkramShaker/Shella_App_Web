class ResponseApiIncomeSourceModel {
  final String? message;
  final ResponseErrors? errors;

  ResponseApiIncomeSourceModel({this.message, this.errors});

  factory ResponseApiIncomeSourceModel.fromJson(Map<String, dynamic> json) {
    return ResponseApiIncomeSourceModel(
      message: json['message'],
      errors: json['errors'] != null ? ResponseErrors.fromJson(json['errors']) : null,
    );
  }
}

class ResponseErrors {
  final List<String>? firstName;
  final List<String>? grandfatherName;
  final List<String>? fatherName;
  final List<String>? lastName;
  final List<String>? birthDate;
  final List<String>? nationalId;
  final List<String>? maritalStatus;
  final List<String>? numberOfFamilyMembers;
  final List<String>? identityCardNumber;
  final List<String>? endDate;
  final List<String>? mobile;
  final List<String>? houseType;
  final List<String>? city;
  final List<String>? neighborhood;
  final List<String>? nameOfEmployer;
  final List<String>? totalSalary;
  final List<String>? installments;

  ResponseErrors({
    this.firstName,
    this.grandfatherName,
    this.fatherName,
    this.lastName,
    this.birthDate,
    this.nationalId,
    this.maritalStatus,
    this.numberOfFamilyMembers,
    this.identityCardNumber,
    this.endDate,
    this.mobile,
    this.houseType,
    this.city,
    this.neighborhood,
    this.nameOfEmployer,
    this.totalSalary,
    this.installments,
  });

  factory ResponseErrors.fromJson(Map<String, dynamic> json) {
    return ResponseErrors(
      firstName: json['first_name'] != null ? List<String>.from(json['first_name']) : null,
      grandfatherName: json['grandfather_name'] != null ? List<String>.from(json['grandfather_name']) : null,
      fatherName: json['father_name'] != null ? List<String>.from(json['father_name']) : null,
      lastName: json['last_name'] != null ? List<String>.from(json['last_name']) : null,
      birthDate: json['birth_date'] != null ? List<String>.from(json['birth_date']) : null,
      nationalId: json['national_id'] != null ? List<String>.from(json['national_id']) : null,
      maritalStatus: json['marital_status'] != null ? List<String>.from(json['marital_status']) : null,
      numberOfFamilyMembers: json['number_of_family_members'] != null ? List<String>.from(json['number_of_family_members']) : null,
      identityCardNumber: json['identity_card_number'] != null ? List<String>.from(json['identity_card_number']) : null,
      endDate: json['end_date'] != null ? List<String>.from(json['end_date']) : null,
      mobile: json['mobile'] != null ? List<String>.from(json['mobile']) : null,
      houseType: json['house_type'] != null ? List<String>.from(json['house_type']) : null,
      city: json['city'] != null ? List<String>.from(json['city']) : null,
      neighborhood: json['neighborhood'] != null ? List<String>.from(json['neighborhood']) : null,
      nameOfEmployer: json['name_of_employer'] != null ? List<String>.from(json['name_of_employer']) : null,
      totalSalary: json['total_salary'] != null ? List<String>.from(json['total_salary']) : null,
      installments: json['installments'] != null ? List<String>.from(json['installments']) : null,
    );
  }
}
