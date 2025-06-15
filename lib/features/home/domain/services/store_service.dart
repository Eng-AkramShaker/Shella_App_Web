import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';

class StoreService {
  Future<List<StoreModel>> fetchStores({int offset = 1, int limit = 50}) async {
    final url = Uri.parse(
      '${Api_Constants.apiBaseUrl}${Api_Constants.getAllStoresUri}?offset=$offset&limit=$limit',
    );

    final response = await http.get(url, headers: {
      ...Api_Constants.defaultHeaders,
      'moduleId': '3',
      'zoneId': '[1,2,3,4,5]',
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final storesJson = data['stores'] as List;
      return storesJson.map((json) => StoreModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stores: ${response.statusCode}');
    }
  }
}
