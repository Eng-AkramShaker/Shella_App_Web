import 'dart:convert';

import 'package:http/http.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/my_points/domain/models/my_coupons_model.dart';
import 'package:shella_design/features/my_points/domain/models/transaction_model.dart';
import 'package:shella_design/features/my_points/domain/repositories/my_points_repository_interface.dart';
import 'package:shella_design/features/my_points/domain/services/my_points_service_interface.dart';
import 'package:shella_design/features/my_points/domain/models/userinfo_model.dart';

class LoyaltyService implements MyPointsServiceInterface {
  final MyPointsRepositoryInterface myPointsRepositoryInterface;
  LoyaltyService({required this.myPointsRepositoryInterface});
  @override
  Future<void> convertPoints(int points) async {
    try {
      Response? response = await myPointsRepositoryInterface.convertPoints(points);
      if (response!.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Converting Points Failed');
      }
    } catch (e) {
      customPrint('Convert Points Exception :: ${e.toString()}');
      throw Exception('Convert Points Exception :: ${e.toString()}');
    }
  }

  @override
  Future<User_Model> fetchUserProfile() async {
    try {
      Response? response = await myPointsRepositoryInterface.fetchUserProfile();
      if (response!.statusCode == 200) {
        return User_Model.fromJson(json.decode(response.body));
      } else {
        throw Exception('Fetching User Profile Failed');
      }
    } catch (e) {
      customPrint('Fetching User Profile Exception :: ${e.toString()}');
      throw Exception('Fetching User Profile Exception :: ${e.toString()}');
    }
  }

  @override
  Future<TransactionModel?> getTransactions(String offset) async {
    try {
      Response? response = await myPointsRepositoryInterface.getTransactions(offset);
      if (response!.statusCode == 200) {
        return TransactionModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Get Points Transactions Failed');
      }
    } catch (e) {
      customPrint('Get Points Transactions Exception :: ${e.toString()}');
      throw Exception('Get Points Transactions Exception :: ${e.toString()}');
    }
  }

  @override
  Future<List<CouponModel>> getCouponsList() async {
    try {
      Response? response = await myPointsRepositoryInterface.getCouponsList();
      if (response!.statusCode == 200) {
        final rawList = json.decode(response.body) as List<dynamic>;
        return rawList.map((item) => CouponModel.fromJson(item as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Get Coupons Failed');
      }
    } catch (e) {
      customPrint('Get Coupons Exception :: ${e.toString()}');
      throw Exception('Get Coupons Exception :: ${e.toString()}');
    }
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
//  // import 'package:shella_design/features/my_points/domain/models/transaction_model.dart';
// import 'package:shella_design/features/profile_detailes/domain/models/userinfo_model.dart';
//
// class LoyaltyService {
//   /* static const String _baseUrl = 'https://shalafood.net/api/v1';
//   final String _token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiMzM5NTVjMGEzYTExNjkzY2JhN2EwMmQyNGNiOWY4MTVjYTM3NjE2NTMxY2YxZmUxMGU2M2NhOTYwM2E0ZjZjODYyZjQwMWM2YTAyMTZlMTMiLCJpYXQiOjE3NDc1NjM4NzMuNzA1MzIsIm5iZiI6MTc0NzU2Mzg3My43MDUzMjIsImV4cCI6MTc3OTA5OTg3My43MDM2MzQsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.osb5PVuZCBUGxDjXhJZYHp22G49x4m0DzkTRXRYidNTkl54qOJ_qV5tP0GqSbyK648xiM0692_0D8JOviurtXGHWIwkTEuf82CvpUkXVi7wQLAlAVFH7YkXmo8goKtiGgJiLPHnpbjZYCd6Q0SAW1tX4XjckqTV07cKGa8qKEmw2de5jHdX1VF7RmSiHOwzSAu1aSyf18-2u6umJyx8kn_ydHMfh5Z8-U9EMU2LrPAFteSXJ7iPReb8ad-msiDQcRt3Pnv8QMMhXxPLTEl-FAeAuNQou95vPZEM5Kz04PVwfYcDSoHTCi1UPYB_wEVsUtonzo-1QehcrbCOMSpZ4ZFC_xcCdacJRviau9InbCEGDknzD8A3TFyBZxoZRExBMaCzuVRBSbvrxGEW5X6FvJWofGqh7JtvyMZ325dk_gai2-sKcUpCirCQeZqMbmdcbqEDO4S42vmBaZi8Mzsg6cb7GSwHw8ua24lXSKZtdYHEEeK5Myf-Hm4b5K19GM7c5LbM9dTbEWq3DYaxrjoRkgPEGjXoqn8f2QHYODBl8yECMZSahc60X0qeTbkwJmZ0x8TfLJCm0KmyzmkEkkjjAfnEY1_4olmlw8tqQbsDuHc84msB7gR1F7O3-TADvO_p4efiHV4YtVClr-gjAgaFV2PeNbX9VQpQ_NGHmGg_qn4s';
//  */
//   Future<User_Model> fetchUserProfile() async {
//     final response = await http.get(
//       Uri.parse(ApiConstants.customerInfoUri),
//       headers: _headers,
//     );
//
//     if (response.statusCode == 200) {
//       return User_Model.fromJson(json.decode(response.body));
//     }
//     throw Exception('Failed to load profile: ${response.statusCode}');
//   }
//
//   Future<void> convertPoints(int points) async {
//     final response = await http.post(
//       Uri.parse(ApiConstants.pointsConversionUri),
//       headers: _formHeaders,
//       body: {'point': points.toString()},
//     );
//
//     if (response.statusCode != 200) {
//       throw Exception('Conversion failed: ${response.reasonPhrase}');
//     }
//   }
//
//   Future<TransactionModel?> getTransactions(String offset) async{
//     final response = await http.get(
//       Uri.parse('${ApiConstants.pointsTransactionsUri}?limit=10&offset=$offset'),
//       headers: _headers,
//     );
//     if(response.statusCode == 200){
//     return TransactionModel.fromJson(json.decode(response.body));
//     }
//     throw Exception('Failed to load Transaction: ${response.statusCode} ${response.body}');
//
//   }
//
//   Map<String, String> get _headers => {
//     'Accept': 'application/json',
//     'Content-Type': 'application/json',
//     'X-localization': 'en',
//     'zoneId': '[2]',
//     'moduleId': '3',
//     'Authorization': 'Bearer ${ApiConstants.token}'
//   };
//
//   Map<String, String> get _formHeaders => {
//     'Accept': 'application/json',
//     'Content-Type': 'application/x-www-form-urlencoded',
//     'X-localization': 'en',
//     'Authorization': 'Bearer ${ApiConstants.token}'
//   };
// }
