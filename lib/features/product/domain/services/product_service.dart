import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/features/product/domain/models/product_model.dart';

class ProductService {
  Future<List<Product>> fetchProducts({
    required int storeId,
    int categoryId = 0,
    int offset = 1,
    int limit = 13,
    String type = 'all',
  }) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'zoneId': '[1,2,3,4,5]',
      'moduleid': '3',
    };

    var url =
        'https://shalafood.net/api/v1/items/latest?store_id=$storeId&category_id=$categoryId&offset=$offset&limit=$limit&type=$type';

    print("Calling API: $url");

    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonData = json.decode(await response.stream.bytesToString());
      final List<dynamic> data = jsonData['products'];
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
