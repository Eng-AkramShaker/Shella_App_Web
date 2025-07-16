import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:http/http.dart' as http;
import 'package:shella_design/features/join_as_driver/domain/models/join_as_driver_model.dart';
import 'package:shella_design/features/join_as_driver/domain/repositories/joinAsDriverRepositioryInterface/join_as_driver_repositiory_interface.dart';

class DeliveryManRepository implements DeliveryManRepositoryInterface {
  @override
  Future<bool> registerDeliveryMan(DeliveryManBody deliveryManBody) async {
    try {
      var uri = Uri.parse('https://shellafood.com/api/v1/auth/delivery-man/store');
      var request = http.MultipartRequest('POST', uri)
        ..fields['f_name'] = deliveryManBody.fName
        ..fields['l_name'] = deliveryManBody.lName
        ..fields['phone'] = deliveryManBody.phone
        ..fields['email'] = deliveryManBody.email
        ..fields['password'] = deliveryManBody.password
        ..fields['identity_number'] = deliveryManBody.identityNumber
        ..fields['identity_type'] = deliveryManBody.identityType
        ..fields['earning'] = deliveryManBody.earning
        ..fields['zone_id'] = deliveryManBody.zoneId
        ..fields['vehicle_id'] = deliveryManBody.vehicleId
        ..files.add(await http.MultipartFile.fromPath('identity_image', deliveryManBody.imagePathProfile))
        ..files.add(await http.MultipartFile.fromPath('driving_license_image', deliveryManBody.licenseImagePath));
      print('--- MultipartRequest Started ---');
      print('URL: $uri');
      print('Method: POST');

      var response = await request.send();
      print('--- MultipartResponse Received ---');
      print('Status Code: ${response.statusCode}');
      print('Response Headers: ${response.headers}');
      print('Response Body:${response.stream}');
      debugPrint('API Response Status Code: ${response.statusCode}');
      final responseBody = await response.stream.bytesToString();
      debugPrint('Response Body: $responseBody');

      return response.statusCode == 200;
    } catch (e) {
      debugPrint('❌ خطأ في الريبو: $e');
      return false;
    }
  }
}
