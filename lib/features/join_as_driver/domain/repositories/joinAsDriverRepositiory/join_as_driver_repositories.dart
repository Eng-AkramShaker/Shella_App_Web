import 'package:flutter/material.dart';
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
       // ..fields['earning'] = deliveryManBody.earning.toString()
        ..fields['zone_id'] = deliveryManBody.zoneId.toString()
        //..fields['vehicle_id'] = deliveryManBody.vehicleId.toString()
        ..files.add(await http.MultipartFile.fromPath('identity_image', deliveryManBody.imagePath));

      var response = await request.send();

      return response.statusCode == 200;
    } catch (e) {
      debugPrint('❌ خطأ في الريبو: $e');
      return false;
    }
  }
}