import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/discount/domain/repositories/discountRepositoryInterface/discount_repository_interface.dart';

class DiscountRepository implements DiscountRepositoryInterface {
  @override
  Future<List<dynamic>> fetchDiscountedProducts() async {
    final apiUrl = ApiConstants.discountProducts;
    print('Fetching discounted products from $apiUrl');

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'zoneId': '[2,4,3,5]',
          'moduleId': '3',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        //print('🟢 [5] تم فك التشفير بنجاح، عدد المنتجات: ${jsonData['products']?.length ?? 0}');
        return jsonData['products'] ?? [];
      } else {
        // print('🔴 [6] خطأ في الرد: ${response.statusCode}');
        throw Exception('فشل الطلب: ${response.statusCode}');
      }
    } catch (e) {
      //  print('🔴 [7] خطأ في الخدمة: $e');
      rethrow;
    }
  }
}
