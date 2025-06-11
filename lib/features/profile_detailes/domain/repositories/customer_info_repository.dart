import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/profile_detailes/domain/models/customer_info_model.dart';
import 'package:shella_design/features/profile_detailes/domain/repositories/customer_info_reposittory_interface.dart';

class CustomerRepository implements CustomerRepositoryInterface {
   final ApiClient apiClient;
  CustomerRepository({required this.apiClient});
  @override
  Future<CustomerModel> getCustomerInfo() async {
    final uri = Uri.parse(Api_Constants.customerInfo);
    final response = await apiClient.getData(
      uri.toString(),
      headers: {
        'zoneId': '[2,4,3,5]',
        'moduleId': '3',
        'X-localization': 'ar',
        'Accept': '*/*',
      },
    );
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return CustomerModel.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load customer data');
    }
  }
}