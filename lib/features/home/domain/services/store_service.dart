import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/features/home/domain/models/store_model.dart';

class StoreService {
  final _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'moduleId': '3',
    'zoneId': '[1,2,3,4,5]',
  };

  Future<List<StoreModel>> fetchStores() async {
    var url = Uri.parse(
        'https://shalafood.net/api/v1/stores/get-stores/all?offset=1&limit=50');
    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final storesJson = data['stores'] as List;
      return storesJson.map((json) => StoreModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stores');
    }
  }
}
