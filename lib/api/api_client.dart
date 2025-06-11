// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
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
  token = sharedPreferences.getString(SharedPrefKeys.userToken);
  debugPrint('🟠 التوكن من SharedPreferences: $token');
  _headers = {
    'Content-Type': 'application/json',
    'Authorization': token != null && token!.isNotEmpty ? 'Bearer $token' : '',
    'Accept': 'application/json',
    'Accept-Language': 'ar',
    // Make sure these are ALWAYS present in the _headers if required by API for authentication
    'zoneId': '[2,4,3,5]', // Ensure these match Postman exactly
    'moduleId': '3',     // Ensure these match Postman exactly
    'X-localization': 'ar', // Ensure this matches Postman exactly
  };
  debugPrint('🔄 تم تحديث الـ headers: $_headers');
  notifyListeners();
}

  // >>>>>> عدّل السطر ده <<<<<<
  Future<http.Response> getData(String uri, {Map<String, String>? headers}) async { // أضف named parameter 'headers'
    try {
      Uri fullUri = Uri.parse('$uri');

      // دمج الـ headers الداخلية مع أي headers إضافية تم تمريرها
      final Map<String, String> requestHeaders = Map.from(_headers); // ابدأ بالـ headers الأساسية
      if (headers != null) {
        requestHeaders.addAll(headers); // أضف أو استبدل بالـ headers اللي جاية كـ parameter
      }

      debugPrint('🔵 [API] جلب بيانات من: ${fullUri.toString()}');
      debugPrint('🔵 [API] Headers المرسلة: $requestHeaders');
      debugPrint('📡 Sending GET request to: $fullUri');
debugPrint('📦 Headers: $requestHeaders');
debugPrint('🕒 Waiting for response...'); // اطبع الـ headers النهائية اللي هتتبعت

      final response = await http.get(
        fullUri,
        headers: requestHeaders, // استخدم الـ headers المدمجة
      ).timeout(Duration(seconds: 10));
      return response;
    } catch (e) {
      debugPrint('🔴 [API Error] ${e.toString()}');
      throw Exception('فشل الاتصال بالخادم: ${e.toString()}');
    }
  }



  Future<http.Response?> postData(String uri, dynamic body) async {
    try {
      final response = await http.post(
        Uri.parse("$appBaseUrl$uri"),
        headers: _headers,
        body: jsonEncode(body),
      );
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
      final response = await http.put(
        Uri.parse("$appBaseUrl$uri"),
        headers: _headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      debugPrint('PUT Error: $e');
      return null;
    }
  }

  Future<http.Response?> deleteData(String uri) async {
    try {
      final response = await http.delete(
        Uri.parse("$appBaseUrl$uri"),
        headers: _headers,
      );
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
      debugPrint("API Error: ${response.statusCode} - ${response.body}");
      return null;
    }
  }
}

class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}
