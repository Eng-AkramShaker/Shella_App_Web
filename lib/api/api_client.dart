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
  
  // توكن ثابت للاختبار - سيتم استخدامه إذا كان متوفراً
  static const String FIXED_TEST_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiOTczMDQ3ZDJmZjEyY2JlMDkwMDA3ZWQ3OTIyYWFlNGYyODY2YjZkMDkxNmY2NGEyMmNlZjk2NjhjNTM5NTM0MDJiNjRlZDk3M2E4YjRjMTYiLCJpYXQiOjE3NDc1MDY3NDcuMTI3Mzk5LCJuYmYiOjE3NDc1MDY3NDcuMTI3NDAyLCJleHAiOjE3NzkwNDI3NDcuMTI1NjQ2LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.qS23wdx6Oni7tM1ETa9SnksJQAqMFPsZgiFZ6U7eu3kcJrkaSIFrA6lV1VocWc2fqxJzQzUZyvU6KHM-GLU5PE48Qt9dLj81_109f9YLAc-6dt2gHAFqfr9r0VG5VLm411oVNZGrHO3dJxYQge5_yY-oACtH0_Gi_6T7UzC1pdO4C4E6Ik7-WzXxMHkRfqIIoOV9u43fVEEzFcrvX5zjud175kd4FObU04QPzDNQML98JT4hMpApe81cwzI8ivwMg-VlVTgDSOrGusAw64jrAfOrOyg_a9VWSmCOu6uH25rXuqie6AEMMMyd23uxccvVOO0HBcoKorSfoQZIHBn1k6onMfv0thPbLSkn1nxsB3Fm9uAe-cQYWDOD91nGAxI2cRc8cgiXOZzBEth4_acUlK9rJq0koxp5Nkqei1yEQtEE69J0xeBmTJ1vRx8asx7yD-GPOOpRkSB3Lb8mZfuBg9Hpvj5RIPucRcsFwoF_iqaPfQ-HQZgXUNpQ-gUZbmwojf62szWBa7agZHwt0lpxthdEqYMIbK-7iflcbVzB8hl0KPJ6G9c1TU9BIIFnHiBXx7PTbXT5JqV4cY85l3r6X29vqLf7K3gQtSDkVZk6Hdp2BFu-iQEQD8DvTUdEtnit0XUh5IRyPjhZvdMRfeAzvxDFYp1gLZA4I7_On0LgF7k";

  ApiClient({
    required this.appBaseUrl,
    required this.sharedPreferences,
  }) {
    _updateHeaders();
  }

  void _updateHeaders() {
    // استخدام التوكن الثابت للاختبار بدلاً من التوكن المخزن
    final token = FIXED_TEST_TOKEN;
    
    if (token.isNotEmpty) {
      debugPrint('استخدام توكن ثابت للاختبار');
    } else {
      debugPrint('تحذير: لا يوجد توكن متاح');
    }

    // تعديل الهيدرز لتتوافق مع متطلبات الخادم
    _headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'zoneid': '[1,2,3,4,5]',
    };
    
    // إضافة التوكن بشكل منفصل للتأكد من تنسيقه الصحيح
    if (token.isNotEmpty) {
      // إزالة أي مسافات زائدة قد تكون موجودة في التوكن
      final cleanToken = token.trim();
      _headers['Authorization'] = 'Bearer $cleanToken';
      
      // محاولة فك تشفير التوكن للتحقق من صلاحيته
      try {
        final parts = cleanToken.split('.');
        if (parts.length == 3) {
          // فك تشفير الجزء الثاني من التوكن (payload)
          final payload = parts[1];
          final normalized = base64Url.normalize(payload);
          final decodedPayload = utf8.decode(base64Url.decode(normalized));
          final payloadMap = json.decode(decodedPayload);
          
          // التحقق من تاريخ انتهاء الصلاحية
          if (payloadMap.containsKey('exp')) {
            final expiry = DateTime.fromMillisecondsSinceEpoch(payloadMap['exp'] * 1000);
            final now = DateTime.now();
            if (expiry.isBefore(now)) {
              debugPrint('تحذير: التوكن منتهي الصلاحية! تاريخ الانتهاء: $expiry');
            } else {
              debugPrint('التوكن صالح حتى: $expiry');
            }
          }
        }
      } catch (e) {
        debugPrint('خطأ في فك تشفير التوكن: $e');
      }
    }

    debugPrint('تم تعيين الهيدرز: $_headers');
    notifyListeners();
  }

  // دالة للتحقق من التوكن وتحديثه إذا لزم الأمر
  bool updateToken(String newToken) {
    if (newToken.isNotEmpty) {
      // إزالة أي مسافات زائدة
      final cleanToken = newToken.trim();
      sharedPreferences.setString(SharedPrefKeys.userToken, cleanToken);
      _updateHeaders();
      return true;
    }
    return false;
  }

  // دالة للتحقق من وجود التوكن
  bool hasValidToken() {
    // استخدام التوكن الثابت للاختبار
    return FIXED_TEST_TOKEN.isNotEmpty;
  }

  // دالة لتحديث الهيدرز قبل كل طلب
  void refreshHeaders() {
    _updateHeaders();
  }

  Future<http.Response?> getData(
    String uri, {
    Map<String, dynamic>? query,
    bool forceRefreshToken = false,
    bool attemptTokenRefresh = true,
  }) async {
    // تحديث الهيدرز قبل كل طلب للتأكد من استخدام أحدث توكن
    if (forceRefreshToken) {
      refreshHeaders();
    }

    if (!hasValidToken() &&
        !uri.contains('/login') &&
        !uri.contains('/register')) {
      debugPrint('محاولة الوصول لمسار محمي بدون توكن: $uri');
      return null;
    }

    try {
      final url = Uri.parse('$appBaseUrl$uri').replace(queryParameters: query);
      debugPrint('إرسال طلب GET إلى: $url');
      debugPrint('باستخدام هيدرز: $_headers');

      final response = await http.get(url, headers: _headers);

      debugPrint('استجابة: ${response.statusCode}');
      if (response.statusCode == 401) {
        debugPrint('خطأ في التوثيق: ${response.body}');
      }

      return _handleResponse(response);
    } catch (e) {
      debugPrint('خطأ GET: $e');
      return null;
    }
  }

  Future<http.Response?> postData(
    String uri, 
    dynamic body, {
    bool attemptTokenRefresh = true,
  }) async {
    // تحديث الهيدرز قبل كل طلب للتأكد من استخدام أحدث توكن
    refreshHeaders();
    
    try {
      debugPrint('إرسال طلب POST إلى: $appBaseUrl$uri');
      debugPrint('باستخدام هيدرز: $_headers');
      debugPrint('مع البيانات: $body');

      final response = await http.post(
        Uri.parse('$appBaseUrl$uri'),
        headers: _headers,
        body: jsonEncode(body),
      );

      debugPrint('استجابة: ${response.statusCode}');
      
      return _handleResponse(response);
    } catch (e) {
      log('خطأ POST: $e');
      return null;
    }
  }

  Future<http.Response?> putData(
    String uri, 
    dynamic body, {
    bool attemptTokenRefresh = true,
  }) async {
    // تحديث الهيدرز قبل كل طلب للتأكد من استخدام أحدث توكن
    refreshHeaders();
    
    try {
      final response = await http.put(
        Uri.parse('$appBaseUrl$uri'),
        headers: _headers,
        body: jsonEncode(body),
      );
      
      return _handleResponse(response);
    } catch (e) {
      debugPrint('خطأ PUT: $e');
      return null;
    }
  }

  Future<http.Response?> deleteData(
    String uri, {
    bool attemptTokenRefresh = true,
  }) async {
    // تحديث الهيدرز قبل كل طلب للتأكد من استخدام أحدث توكن
    refreshHeaders();
    
    try {
      final response = await http.delete(
        Uri.parse('$appBaseUrl$uri'),
        headers: _headers,
      );
      
      return _handleResponse(response);
    } catch (e) {
      debugPrint('خطأ DELETE: $e');
      return null;
    }
  }

  Future<http.Response?> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody, {
    bool attemptTokenRefresh = true,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$appBaseUrl$uri'),
      );

      // استخدام التوكن الثابت للاختبار
      final token = FIXED_TEST_TOKEN;
      if (token.isNotEmpty) {
        // إزالة أي مسافات زائدة
        final cleanToken = token.trim();
        request.headers['Authorization'] = 'Bearer $cleanToken';
      }
      request.headers['zoneid'] = '[1,2,3,4,5]';

      request.fields.addAll(body);

      for (final multipart in multipartBody) {
        if (multipart.file != null) {
          final bytes = await multipart.file!.readAsBytes();
          request.files.add(http.MultipartFile(
            multipart.key,
            multipart.file!.readAsBytes().asStream(),
            bytes.length,
            filename: '${DateTime.now().millisecondsSinceEpoch}.png',
          ));
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      debugPrint(response.body);
      
      return _handleResponse(response);
    } catch (e) {
      debugPrint('خطأ Multipart POST: $e');
      return null;
    }
  }

  http.Response? _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      debugPrint('خطأ API: ${response.statusCode}, البيانات: ${response.body}');

      // معالجة خطأ التوثيق
      if (response.statusCode == 401) {
        // هنا يمكن إضافة منطق لإعادة توجيه المستخدم لشاشة تسجيل الدخول
        debugPrint('خطأ في التوثيق - يجب إعادة تسجيل الدخول');
      }

      return null;
    }
  }
  
  // إضافة دالة مساعدة للحصول على الحد الأدنى من رقمين
  int min(int a, int b) {
    return a < b ? a : b;
  }
}

class MultipartBody {
  final String key;
  final XFile? file;

  MultipartBody(this.key, this.file);
}
