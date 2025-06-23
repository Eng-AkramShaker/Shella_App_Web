// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shella_design/api/api_checker.dart';
import 'package:shella_design/common/models/error_response.dart';
import 'package:shella_design/common/util/indian_app_constants.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';
import '../common/helper/app_routes.dart';
import '../common/util/app_navigators.dart';

class ApiClient {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 40;

  String? token;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(SharedPrefKeys.userToken);
    if (kDebugMode) {
      print('Token: $token');
    }
    // AddressModel? addressModel;
    // try {
    //   addressModel = AddressModel.fromJson(
    //       jsonDecode(sharedPreferences.getString(AppConstants.userAddress)!));
    // } catch (_) {}
    // int? moduleID;
    // if (GetPlatform.isWeb &&
    //     sharedPreferences.containsKey(AppConstants.moduleId)) {
    //   try {
    //     moduleID = ModuleModel.fromJson(
    //             jsonDecode(sharedPreferences.getString(AppConstants.moduleId)!))
    //         .id;
    //   } catch (_) {}
    // }
    updateHeader(
      token,
      [],
      [],
      'ar',
      0,
      '1',
      '1',
      setHeader: true,
      // addressModel?.zoneIds,
      // addressModel?.areaIds,

      // sharedPreferences.getString(AppConstants.languageCode),
      // moduleID,
      // addressModel?.latitude,
      // addressModel?.longitude,
    );
  }

  Map<String, String> updateHeader(
      String? token,
      List<int>? zoneIDs,
      List<int>? operationIds,
      String? languageCode,
      int? moduleID,
      String? latitude,
      String? longitude,
      {bool setHeader = true}) {
    Map<String, String> header = {};

    if (moduleID != null ||
        sharedPreferences.getString(AppConstants.cacheModuleId) != null) {
      // header.addAll({
      //   AppConstants.moduleId:
      //       '${moduleID ?? ModuleModel.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.cacheModuleId)!)).id}'
      // });
    }
    header.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      AppConstants.zoneId: zoneIDs != null ? jsonEncode(zoneIDs) : '',

      ///this will add in ride module
      // AppConstants.operationAreaId: operationIds != null ? jsonEncode(operationIds) : '',
      AppConstants.localizationKey: languageCode ?? 'ar',
      AppConstants.latitude: latitude != null ? jsonEncode(latitude) : '',
      AppConstants.longitude: longitude != null ? jsonEncode(longitude) : '',
      'Authorization': 'Bearer $token'
    });
    if (setHeader) {
      _mainHeaders = header;
    }
    return header;
  }

  Map<String, String> getHeader() => _mainHeaders;

  Future<http.Response> getData(String uri,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri  ');
      }

      final stopwatch = Stopwatch()..start();

      http.Response response = await http
          .get(Uri.parse(appBaseUrl + uri), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));

      stopwatch.stop();

      if (kDebugMode) {
        print('⏱️ زمن الاستجابة:  (${stopwatch.elapsed.inSeconds} ثانية)');
      }
      if (kDebugMode) {
        var reponsemap = jsonDecode(response.body);
        print("====> API response body: $reponsemap");
      }
      return handleResponse(response, uri, handleError);
    } catch (e) {
      if (kDebugMode) {
        print('❌ خطأ في الاتصال: ${e.toString()}');
      }
      return http.Response('error', 1);
    }
  }

  Future<http.Response> postData(String uri, dynamic body,
      {Map<String, String>? headers,
      int? timeout,
      bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri ');
        print('====> API Body: $body');
      }
      http.Response response = await http
          .post(Uri.parse(appBaseUrl + uri),
              body: jsonEncode(body), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeout ?? timeoutInSeconds));
      if (kDebugMode) {
        var reponsemap = jsonDecode(response.body);
        print("====> API response body: $reponsemap");
      }
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return http.Response('error', 1);
    }
  }

  //

  Future<http.Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        // print('====> API Body: $body with ${multipartBody.length} picture');
      }
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      request.headers.addAll(headers ?? _mainHeaders);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          Uint8List list = await multipart.file!.readAsBytes();
          request.files.add(http.MultipartFile(
            multipart.key,
            multipart.file!.readAsBytes().asStream(),
            list.length,
            filename: '${DateTime.now().toString()}.png',
          ));
        }
      }
      Map<String, String> newBody = {};
      body.forEach((s, i) {
        if (i.isNotEmpty) {
          newBody.addAll({s: i});
        }
      });
      request.fields.addAll(newBody);
      http.Response response =
          await http.Response.fromStream(await request.send());
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return http.Response('error', 1);
    }
  }

  Future<http.Response> putData(String uri, dynamic body,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        print('====> API Body: $body');
      }
      http.Response response = await http
          .put(
            Uri.parse(appBaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return http.Response('error', 1);
    }
  }

  Future<http.Response> deleteData(String uri,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
      }
      http.Response response = await http
          .delete(Uri.parse(appBaseUrl + uri), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return http.Response('error', 1);
    }
  }

  http.Response handleResponse(
      http.Response response, String uri, bool handleError) {
    if (kDebugMode) {
      print('====> API Call: $uri ');
      print('..====>>> API Response: [${response.statusCode}] $uri');
    }

    try {
      final body = jsonDecode(response.body);
      if (response.statusCode == 401) {
        pushAndRemoveUntil(Navigation.currentContext, AppRoutes.Login_Mobile);
        return response;
      } else
      // Optional: Custom error handling if API returns structured error formats
      if (response.statusCode != 200 && body is Map<String, dynamic>) {
        if (body.containsKey('errors') && body['errors'] is List) {
          final errorResponse = ErrorResponse.fromJson(body);
          final errorMsg =
              errorResponse.errors?.first.message ?? 'Unknown error';
          throw Exception(errorMsg);
        } else if (body.containsKey('message')) {
          throw Exception(body['message']);
        }
      }
    } catch (e) {
      if (handleError) {
        ApiChecker.checkApi(
            response); // Or pass `response` if your checker supports `http.Response`
      }
    }

    return response;
  }
}

class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}
