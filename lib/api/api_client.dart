// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shella_design/api/api_checker.dart';
import 'package:shella_design/common/models/error_response.dart';
import 'package:shella_design/common/util/Api_constants.dart';

import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';
import '../common/helper/app_routes.dart';

class ApiClient {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 40;

  String? token;
  late Map<String, String> _mainHeaders;

  initHeader() {
    token = sharedPreferences.getString(SharedPrefKeys.userToken);
    if (kDebugMode) {
      print('Token: $token');
    }
    if (token == null || token!.split('.').length != 3) {
      throw Exception('Invalid JWT format');
    }
    updateHeader(
      token,
      [],
      [],
      'ar',
      0,
      '1',
      '1',
      setHeader: true,
    );
  }

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
        sharedPreferences.getString(Api_Constants.cacheModuleId) != null) {
      // header.addAll({
      //   AppConstants.moduleId:
      //       '${moduleID ?? ModuleModel.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.cacheModuleId)!)).id}'
      // });
    }
    header.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      Api_Constants.zoneId: zoneIDs != null ? jsonEncode(zoneIDs) : '',

      ///this will add in ride module
      // AppConstants.operationAreaId: operationIds != null ? jsonEncode(operationIds) : '',
      Api_Constants.localizationKey: languageCode ?? 'ar',
      Api_Constants.latitude: latitude != null ? jsonEncode(latitude) : '',
      Api_Constants.longitude: longitude != null ? jsonEncode(longitude) : '',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
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
      initHeader();
      final stopwatch = Stopwatch()..start();

      http.Response response = await http
          .get(Uri.parse(appBaseUrl + uri), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      print(
          "//////////////////////////////////////////////////// ${response.request?.headers}");
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

  Future<http.Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        // print('====> API Body: $body with ${multipartBody.length} picture');
      }
      initHeader();
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
      initHeader();
      final fullUri = Uri.parse(appBaseUrl + uri);
      final request = http.Request('PUT', fullUri);
      request.headers.addAll(headers ?? _mainHeaders);

      request.body = jsonEncode(body);
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return handleResponse(response, uri, handleError);
      // http.Response response = await http
      //     .put(
      //       Uri.parse(appBaseUrl + uri),
      //       body: jsonEncode(body),
      //       headers: headers ?? _mainHeaders,
      //     )
      //     .timeout(Duration(seconds: timeoutInSeconds));
      // return handleResponse(response, uri, handleError);
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
      initHeader();
      http.Response response = await http
          .delete(Uri.parse(appBaseUrl + uri), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      print('✅ اكتمل طلب DELETE - status: ${response.statusCode}');
      print('📝 محتوى الاستجابة: ${response.body}');
      return response;
    } catch (e) {
      throw HttpException('DELETE failed: ${e.toString()}');
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
        nav.push(AppRoutes.Login_Mobile);

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
      } else if (response.statusCode >= 400) {
        final body = jsonDecode(response.body);
        if (body is Map<String, dynamic>) {
          throw Exception(body['message'] ?? 'Request failed');
        }
      }
      if (response.statusCode == 404) {
        final body = jsonDecode(response.body);
        throw Exception(body['message'] ?? 'Address not found');
      }
    } catch (e) {
      if (handleError) {
        ApiChecker.checkApi(response);
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
