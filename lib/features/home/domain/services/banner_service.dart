import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/home/domain/models/banner_model.dart';

class BannerService {
  Future<List<BannerModel>> fetchBanners() async {
    var headers = {
      ...Api_Constants.defaultHeaders,
      'zoneId': '[2]',
      'Authorization': Api_Constants.authorizationToken,
    };

    final url =
        Uri.parse('${Api_Constants.apiBaseUrl}${Api_Constants.banners}');
    final request = http.Request('GET', url)..headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      final bannersList = data['banners'] as List;

      return bannersList
          .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch banners');
    }
  }
}
