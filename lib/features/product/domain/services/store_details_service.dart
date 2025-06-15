import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/product/domain/models/store_details_model.dart';

class StoreDetailsService {
  const StoreDetailsService();

  Future<StoreDetailsModel> fetchStoreDetails(int storeId) async {
    final url =
        '${Api_Constants.apiBaseUrl}${Api_Constants.storeDetails(storeId)}';
    debugPrint('🛰️  Fetching store details from: $url');

    final resp = await http.get(
      Uri.parse(url),
      headers: _headers,
    );

    debugPrint(' Status: ${resp.statusCode}');
    debugPrint(' Body: ${resp.body}');

    if (resp.statusCode == 200) {
      return StoreDetailsModel.fromJson(json.decode(resp.body));
    }
    throw Exception('Failed to load store details (status ${resp.statusCode})');
  }

  Future<List<ProductModel>> fetchProducts({
    required int storeId,
    required int categoryId,
    required int offset,
    required int limit,
  }) async {
    final url = '${Api_Constants.apiBaseUrl}${Api_Constants.latestProducts}'
        '?store_id=$storeId'
        '&category_id=$categoryId'
        '&offset=$offset'
        '&limit=$limit'
        '&type=all';

    debugPrint('Fetching products from: $url');

    final resp = await http.get(
      Uri.parse(url),
      headers: _headers,
    );

    debugPrint('Status: ${resp.statusCode}');
    debugPrint('Body: ${resp.body}');

    if (resp.statusCode == 200) {
      final body = json.decode(resp.body);
      final productsJson = body['products'] as List<dynamic>;
      return productsJson
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load products (status ${resp.statusCode})');
  }

  Map<String, String> get _headers => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'moduleid': '3',
        'zoneid': '[1,2,3,4,5]',
      };
}
