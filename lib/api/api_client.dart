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
      'Authorization': token != null ? 'Bearer $token' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiOTczMDQ3ZDJmZjEyY2JlMDkwMDA3ZWQ3OTIyYWFlNGYyODY2YjZkMDkxNmY2NGEyMmNlZjk2NjhjNTM5NTM0MDJiNjRlZDk3M2E4YjRjMTYiLCJpYXQiOjE3NDc1MDY3NDcuMTI3Mzk5LCJuYmYiOjE3NDc1MDY3NDcuMTI3NDAyLCJleHAiOjE3NzkwNDI3NDcuMTI1NjQ2LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.qS23wdx6Oni7tM1ETa9SnksJQAqMFPsZgiFZ6U7eu3kcJrkaSIFrA6lV1VocWc2fqxJzQzUZyvU6KHM-GLU5PE48Qt9dLj81_109f9YLAc-6dt2gHAFqfr9r0VG5VLm411oVNZGrHO3dJxYQge5_yY-oACtH0_Gi_6T7UzC1pdO4C4E6Ik7-WzXxMHkRfqIIoOV9u43fVEEzFcrvX5zjud175kd4FObU04QPzDNQML98JT4hMpApe81cwzI8ivwMg-VlVTgDSOrGusAw64jrAfOrOyg_a9VWSmCOu6uH25rXuqie6AEMMMyd23uxccvVOO0HBcoKorSfoQZIHBn1k6onMfv0thPbLSkn1nxsB3Fm9uAe-cQYWDOD91nGAxI2cRc8cgiXOZzBEth4_acUlK9rJq0koxp5Nkqei1yEQtEE69J0xeBmTJ1vRx8asx7yD-GPOOpRkSB3Lb8mZfuBg9Hpvj5RIPucRcsFwoF_iqaPfQ-HQZgXUNpQ-gUZbmwojf62szWBa7agZHwt0lpxthdEqYMIbK-7iflcbVzB8hl0KPJ6G9c1TU9BIIFnHiBXx7PTbXT5JqV4cY85l3r6X29vqLf7K3gQtSDkVZk6Hdp2BFu-iQEQD8DvTUdEtnit0XUh5IRyPjhZvdMRfeAzvxDFYp1gLZA4I7_On0LgF7k',

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
