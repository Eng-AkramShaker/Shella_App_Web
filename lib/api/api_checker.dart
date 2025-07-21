// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shella_design/common/widgets/custom_snackbar.dart';

class ApiChecker {
  static void checkApi(BuildContext context, http.Response response, {bool getXSnackBar = false}) {
    String? errorMessage;

    try {
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        if (decoded.containsKey('message')) {
          errorMessage = decoded['message'];
        } else if (decoded.containsKey('errors') && decoded['errors'] is List) {
          errorMessage = decoded['errors'][0]['message'];
        }
      }
    } catch (_) {
      errorMessage = 'Unexpected error occurred.';
    }

    if (response.statusCode == 401) {
      // You can trigger logout or redirection here.
      // Get.find<AuthController>().clearSharedData(removeToken: false).then((value) {
      //   Get.find<FavouriteController>().removeFavourite();
      //   Get.offAllNamed(RouteHelper.getInitialRoute());
      // });
    } else {
      if (errorMessage != 'The guest id field is required.') {
        showCustomSnackBar(context, errorMessage ?? 'Unknown error');
        print("checkApi >>>>>>>>>>>>>>   $errorMessage");
      }
    }
  }
}
