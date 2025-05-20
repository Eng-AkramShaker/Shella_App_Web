import 'dart:convert';
import 'package:http/http.dart' as http;

class DiscountService {
  static const String baseUrl = 'https://shalafood.net/api/v1';

  Future<List<dynamic>> getDiscountedProducts() async {
    final url = Uri.parse('$baseUrl/items/discounted?type=all&offset=2&limit=50');

    try {
      final response = await http.get(
        url,
        headers: {
          'zoneId': '[2,4,3,5]',
          'moduleId': '3',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
       // print('🟢 [5] تم فك التشفير بنجاح، عدد المنتجات: ${jsonData['products']?.length ?? 0}');
        return jsonData['products'] ?? [];
      } else {
       // print('🔴 [6] خطأ في الرد: ${response.statusCode}');
        throw Exception('فشل الطلب: ${response.statusCode}');
      }
    } catch (e) {
     // print('🔴 [7] خطأ في الخدمة: $e');
      rethrow;
    }
  }
}