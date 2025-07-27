import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/features/product/domain/models/product_model.dart';

class ProductServices {
  static const String baseUrl = 'https://shellafood.com/api/v1/items/popular';

  Future<List<Product>> fetchPopularProducts() async {
    // Query parameters for limit and offset
    final Map<String, String> queryParameters = {
      'limit': '10', // Or '3' if you prefer your initial body's limit
      'offset': '0', // Or '1' if you prefer your initial body's offset
    };

    // Construct the URI with query parameters
    final uri = Uri.parse(baseUrl).replace(queryParameters: queryParameters);

    // Headers, now including zoneId and moduleId
    final Map<String, String> headers = {
      'Accept': 'application/json',
      // Move zoneId and moduleId back to headers as they seem to be required there
      'zoneId':
          '[2,3,4,5]', // Keep as a string, as it was in the original Postman header
      'moduleId': '3', // Keep as a string
    };

    try {
      final response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> productListJson = data['products'];
        return productListJson.map((json) => Product.fromJson(json)).toList();
      } else {
        // Print detailed error information for debugging
        print('API Error Status Code: ${response.statusCode}');
        print('API Error Response Body: ${response.body}');
        throw Exception(
            'Failed to load products: ${response.statusCode}. Message: ${response.body}');
      }
    } catch (e) {
      print('Network/Parsing Error: $e');
      throw Exception('Failed to connect to the API: $e');
    }
  }
}
