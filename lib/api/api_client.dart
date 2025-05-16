// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';

class ApiClient with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  final String appBaseUrl;
  late Map<String, String> _headers;
  String? token;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    updateHeaders();
  }

  void updateHeaders() {
    String? token = sharedPreferences.getString(SharedPrefKeys.userToken);
    _headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token != null ? 'Bearer $token' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYmM3ZDYyY2FmMmFlZDY0ODk3ZDQ0YTk4OWVmMWY2N2E0NjIwZDVlMTFiYzM0NmEwODM0ZTgyYjg2ZDZlYWIyOWRlZjcyZDlhODM2OTI3Y2IiLCJpYXQiOjE3NDY0NzUwOTAuNTM3MjAxLCJuYmYiOjE3NDY0NzUwOTAuNTM3MjA5LCJleHAiOjE3NzgwMTEwOTAuNTM0NTg2LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.dekJRiq3c076cBkA8X-_fBIAR8W2MNscf2gjU5-jb7SI1FhiTXNLs8kVREzSI83bdGFVT1OFr94oXqwN8QOdAsEiJxqz8EF54-JAJQspRiWlgNdY2rUyV9pyLn2TxR4BazApS8MsxH2Po_XV9lhS0iboETkU__2qyulgGkTMLJ6g91qqWP0-qoYo1arrUAIlX3ns-uUeK6T7t57t5pv6L11Y_kCSPIgmLSDY7R_Spk8r6AgDY4XIGIdtFk1y0vMQhvQPe6Qxcb7-E9e2MAe3d4CbGnv0HwZ_WZ4sBtDfXOrhexExWevGCfeRVE7BR12AiaD1oBq_UJpWB93MivoB1wE4XI0C3IOpdxxag3xyp-sNdzoeAYB9IMRzNWxZo-WuiMntsct0mVgALsyT6SJaBSmGcLSv3hQRqsxlTTBQXtAqKFwPAxLKtwLkYA9sntJzPw9iEvEDX0iEyv_eSB-FHVl3jRinwH7OiySemHeKb0yKjMzDU_XJBi-DU082pGLhh8stZA1JpEWwU8DTWinOyCe_g-0tuV475uMrx2yNMMRvAcChEiKDBwyjv0PUR5CuP1idviNxUGUzbf9uz9X5mu43kwNswIwErJiOdOy5-7U0VRlb03lxN0EyDA2scF4wo5PJLVRHLhE2Mo8vFt310c_xZlueCSVb8jAopzKIiC4',

    };
    notifyListeners();
  }

  Future<http.Response?> getData(String uri,
      {Map<String, dynamic>? query}) async {
    try {
      Uri url = Uri.parse("$appBaseUrl$uri").replace(queryParameters: query);

      // Log request
      log('GET Request: $url');
      log('Headers: $_headers');
      if (query != null) log('Query params: $query');

      final response = await http.get(url, headers: _headers);

      // Log response
      log('GET Response status: ${response.statusCode}');
      log('GET Response body: ${response.body}');

      return _handleResponse(response);
    } catch (e) {
      debugPrint('GET Error: $e');
      return null;
    }
  }

  Future<http.Response?> postData(String uri, dynamic body) async {
    try {
      Uri url = Uri.parse("$appBaseUrl$uri");

      // Log request
      log('POST Request: $url');
      log('Headers: $_headers');
      log('Body: ${jsonEncode(body)}');

      final response =
          await http.post(url, headers: _headers, body: jsonEncode(body));

      // Log response
      log('POST Response status: ${response.statusCode}');
      log('POST Response body: ${response.body}');

      log('${(_handleResponse(response)) == null}55555');
      return _handleResponse(response);
    } catch (e) {
      log(e.toString());
      debugPrint('POST Error: $e');
      return null;
    }
  }

  Future<http.Response?> putData(String uri, dynamic body) async {
    try {
      Uri url = Uri.parse("$appBaseUrl$uri");

      // Log request
      log('PUT Request: $url');
      log('Headers: $_headers');
      log('Body: ${jsonEncode(body)}');

      final response =
          await http.put(url, headers: _headers, body: jsonEncode(body));

      // Log response
      log('PUT Response status: ${response.statusCode}');
      log('PUT Response body: ${response.body}');

      return _handleResponse(response);
    } catch (e) {
      debugPrint('PUT Error: $e');
      return null;
    }
  }

  Future<http.Response?> deleteData(String uri) async {
    try {
      Uri url = Uri.parse("$appBaseUrl$uri");

      // Log request
      log('DELETE Request: $url');
      log('Headers: $_headers');

      final response = await http.delete(url, headers: _headers);

      // Log response
      log('DELETE Response status: ${response.statusCode}');
      log('DELETE Response body: ${response.body}');

      return _handleResponse(response);
    } catch (e) {
      debugPrint('DELETE Error: $e');
      return null;
    }
  }

  Future<http.Response?> postMultipartData(String uri, Map<String, String> body,
      List<MultipartBody> multipartBody) async {
    try {
      Uri url = Uri.parse(appBaseUrl + uri);

      // Log request
      log('MULTIPART POST Request: $url');
      log('Headers: $_headers');
      log('Field data: $body');
      log('Files count: ${multipartBody.length}');

      var request = http.MultipartRequest('POST', url);
      request.headers.addAll(_headers);

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

      request.fields.addAll(body);
      http.StreamedResponse streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      // Log response
      log('MULTIPART POST Response status: ${response.statusCode}');
      log('MULTIPART POST Response body: ${response.body}');

      return _handleResponse(response);
    } catch (e) {
      debugPrint('Multipart POST Error: $e');
      return null;
    }
  }

  // ============================

  http.Response? _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      debugPrint("API Error: ${response.statusCode}  ");
      log("API Error Response: ${response.body}");
      return null;
    }
  }
}

class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}
