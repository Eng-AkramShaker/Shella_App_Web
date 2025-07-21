class NafathRandomModel {
  final String? status;
  final String? requestId;
  final String? message;
  final String? code;
  final List<ExternalResponse>? externalResponse;

  NafathRandomModel({this.status, this.requestId, this.message, this.code, this.externalResponse});

  factory NafathRandomModel.fromJson(Map<String, dynamic> json) {
    return NafathRandomModel(
      status: json["status"],
      requestId: json["request_id"],
      message: json["message"],
      code: json["code"],
      externalResponse: json["external_response"] == null
          ? []
          : List<ExternalResponse>.from(json["external_response"]!.map((x) => ExternalResponse.fromJson(x))),
    );
  }
}

class ExternalResponse {
  ExternalResponse({
    required this.nationalId,
    required this.error,
    required this.transId,
    required this.random,
    required this.code,
    required this.status,
    required this.message,
  });

  final String? nationalId;
  final String? error;
  final String? transId;
  final String? random;
  final dynamic code;
  final dynamic status;
  final String? message;

  factory ExternalResponse.fromJson(Map<String, dynamic> json) {
    return ExternalResponse(
      nationalId: json["nationalId"],
      error: json["error"],
      transId: json["transId"],
      random: json["random"],
      code: json["code"],
      status: json["status"],
      message: json["message"],
    );
  }
}
