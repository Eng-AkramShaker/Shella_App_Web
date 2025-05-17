// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';

import '../common/widgets/print/custom_print.dart';

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
      'Authorization': token != null ? 'Bearer $token' : '',
      'zoneId': '[2,4,3,5]',
      'moduleId': '3',
      'longitude': '46.701550834948726',
      'latitude': '24.604741730570755'
    };
    notifyListeners();
  }

  Future<http.Response?> getData(String uri, {Map<String, dynamic>? query}) async {
    try {
      customPrint('URL ========> ${appBaseUrl+uri}',isUrl: true);
      Uri url = Uri.parse("$appBaseUrl$uri").replace(queryParameters: query);
      final response = await http.get(url, headers: _headers);
      return _handleResponse(response);
    } catch (e) {
      debugPrint('GET Error: $e');
      return null;
    }
  }

  Future<http.Response?> postData(String uri, dynamic body) async {
    try {
      final response = await http.post(Uri.parse("$appBaseUrl$uri"), headers: _headers, body: jsonEncode(body));
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
      final response = await http.put(Uri.parse("$appBaseUrl$uri"), headers: _headers, body: jsonEncode(body));
      return _handleResponse(response);
    } catch (e) {
      debugPrint('PUT Error: $e');
      return null;
    }
  }

  Future<http.Response?> deleteData(String uri) async {
    try {
      final response = await http.delete(Uri.parse("$appBaseUrl$uri"), headers: _headers);
      return _handleResponse(response);
    } catch (e) {
      debugPrint('DELETE Error: $e');
      return null;
    }
  }

  Future<http.Response?> postMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
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

      debugPrint(response.body);
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
      return null;
    }
  }
}

class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}
