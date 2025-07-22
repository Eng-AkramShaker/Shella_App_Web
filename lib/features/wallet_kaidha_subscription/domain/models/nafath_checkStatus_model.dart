// ignore_for_file: file_names

class NafathCheckStatusModel {
  NafathCheckStatusModel({
    required this.status,
    required this.nationalId,
    required this.requestId,
    required this.fullNameAr,
    required this.signedFileUrl,
  });

  final String? status;
  final String? nationalId;
  final String? requestId;
  final String? fullNameAr;
  final dynamic signedFileUrl;

  factory NafathCheckStatusModel.fromJson(Map<String, dynamic> json) {
    return NafathCheckStatusModel(
      status: json["status"],
      nationalId: json["national_id"],
      requestId: json["request_id"],
      fullNameAr: json["full_name_ar"],
      signedFileUrl: json["signed_file_url"],
    );
  }
}
