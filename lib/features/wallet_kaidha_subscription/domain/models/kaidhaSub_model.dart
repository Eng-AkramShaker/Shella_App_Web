// ignore_for_file: file_names, non_constant_identifier_names

class KaidhaSubModel {
  final String? first_name;
  final String? grandfather_name;
  final String? father_name;
  final String? last_name;
  final String? birth_date;
  final String? national_id;
  final String? marital_status;
  final String? number_of_family_members;
  final String? identity_card_number;
  final String? end_date;
  final String? mobile;
  final String? house_type;
  final String? city;
  final String? neighborhood;
  final String? name_of_employer;
  final String? total_salary;
  final String? installments;
  final String? source_of_income;
  final String? monthly_amount;
  final String? salary_day;

  KaidhaSubModel({
    required this.first_name,
    required this.grandfather_name,
    required this.father_name,
    required this.last_name,
    required this.birth_date,
    required this.national_id,
    required this.marital_status,
    required this.number_of_family_members,
    required this.identity_card_number,
    required this.end_date,
    required this.mobile,
    required this.house_type,
    required this.city,
    required this.neighborhood,
    required this.name_of_employer,
    required this.total_salary,
    required this.installments,
    required this.source_of_income,
    required this.monthly_amount,
    required this.salary_day,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': first_name,
      'grandfather_name': grandfather_name,
      'father_name': father_name,
      'last_name': last_name,
      'birth_date': birth_date,
      'national_id': national_id,
      'marital_status': marital_status,
      'number_of_family_members': number_of_family_members,
      'identity_card_number': identity_card_number,
      'end_date': end_date,
      'mobile': mobile,
      'house_type': house_type,
      'city': city,
      'neighborhood': neighborhood,
      'name_of_employer': name_of_employer,
      'total_salary': total_salary,
      'Installments': installments,
      'source_of_income': source_of_income,
      'monthly_amount': monthly_amount,
      'salary_day': salary_day,
    };
  }

  factory KaidhaSubModel.fromJson(Map<String, dynamic> json) {
    return KaidhaSubModel(
      first_name: json['first_name'],
      grandfather_name: json['grandfather_name'],
      father_name: json['father_name'],
      last_name: json['last_name'],
      birth_date: json['birth_date'],
      national_id: json['national_id'],
      marital_status: json['marital_status'],
      number_of_family_members: json['number_of_family_members'],
      identity_card_number: json['identity_card_number'],
      end_date: json['end_date'],
      mobile: json['mobile'],
      house_type: json['house_type'],
      city: json['city'],
      neighborhood: json['neighborhood'],
      name_of_employer: json['name_of_employer'],
      total_salary: json['total_salary'],
      installments: json['Installments'],
      source_of_income: json['source_of_income'],
      monthly_amount: json['monthly_amount'],
      salary_day: json['salary_day'],
    );
  }
}
