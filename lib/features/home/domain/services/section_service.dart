import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/home/domain/models/section_model.dart';

class SectionService {
  Future<List<SectionModel>> fetchCategories() async {
    var headers = {
      ...Api_Constants.defaultHeaders,
      'moduleId': '3',
      'Authorization': Api_Constants.authorizationToken,
    };

    final url =
        Uri.parse('${Api_Constants.apiBaseUrl}${Api_Constants.categories}');
    final request = http.Request('GET', url)..headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);

      final List<dynamic> categoriesJson = data is List
          ? data
          : (data['categories'] ?? data['data'] ?? []) as List<dynamic>;

      return categoriesJson
          .map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch categories: ${response.reasonPhrase}');
    }
  }
}
