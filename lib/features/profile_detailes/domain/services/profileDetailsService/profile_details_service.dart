import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/features/profile_detailes/domain/repositories/profileDetailsRepositoryInterface/profile_details_repository_interface.dart';
import 'package:shella_design/features/profile_detailes/domain/services/profileDetailsServiceInterface/profile_details_service_interface.dart';

class ProfileDetailsService implements ProfileDetailsServiceInterface {
  final ProfileDetailsRepositoryInterface profileRepository;

  ProfileDetailsService({required this.profileRepository});

  @override
  Future<List<Address>> getAddressList() async {
    try {
      Response? response = await profileRepository.getAddressList();
      if (response!.statusCode == 200) {
        if (kDebugMode) {
          print('Fetch Address List Response :: ${response.body}');
        }
        return (jsonDecode(response.body)['addresses']).map<Address>((json) {
          return Address.fromJson(json);
        }).toList();
      } else {
        throw Exception('Fetch Address List Failed');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Fetch Address List Exception :: ${e.toString()}');
      }
      throw Exception('Fetch Address List Exception :: ${e.toString()}');
    }
  }

  @override
  Future<bool> addAddress(Address address) async {
    try {
      Response? response = await profileRepository.addAddress(address);
      if (response!.statusCode == 200) {
        return _handleResponse(response, 'Add Address');
      } else {
        throw Exception('Add Address Exception: ${e.toString()}');
      }
    } catch (e) {
      throw Exception('Add Address Exception :: ${e.toString()}');
    }
  }

  @override
  Future<bool> removeAddress(String addressId) async {
    try {
      Response? response = await profileRepository.removeAddress(addressId);
      if (response == null) throw Exception('Null response');
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 404) {
        throw Exception('العنوان غير موجود');
      } else {
        throw Exception('HTTP ${response.statusCode}: ${body['message']}');
      }
    } catch (e) {
      if (kDebugMode) print('Remove Address Error: $e');
      rethrow;
    }
  }

  @override
  Future<bool> updateAddress(Address address) async {
    try {
      Response? response = await profileRepository.updateAddress(address);
      if (response!.statusCode == 200) {
        if (kDebugMode) {
          print('Update Address Response :: ${response.body}');
        }
        return true;
      } else {
        throw Exception('فشل في تعديل العنوان');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Update Address Exception :: ${e.toString()}');
      }
      throw Exception('فشل في الاتصال');
    }
  }

  bool _handleResponse(Response? response, String operation) {
    if (response?.statusCode == 200) {
      try {
        final body = jsonDecode(response!.body);
        final success = body['status'] == 'success' ||
            body['success'] == true ||
            (body['message'] != null && body['message'].contains('نجاح'));
        return success;
      } catch (e) {
        throw Exception('$operation Failed: Invalid response format');
      }
    }
    throw Exception('$operation Failed: ${response?.statusCode}');
  }
}
