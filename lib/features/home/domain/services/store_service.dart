import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/features/home/domain/models/store_model.dart';

class StoreService {
  Future<List<StoreModel>> fetchStores() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'zoneId': '[2]',
      'moduleId': '3',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiODRhNjY3MzExYWNlOWZiNmI0MTNmNTUwMWUzNjAxZjk4YWUwYmI4YzE4M2ZhNTM0ZjQzODcxZWEwZTIwZGViY2RhYmM5ODZkZjU3NDEyNGYiLCJpYXQiOjE3NDY5MDE5NTcuMDM5MzE4LCJuYmYiOjE3NDY5MDE5NTcuMDM5MzI0LCJleHAiOjE3Nzg0Mzc5NTYuNTM2NjUsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.UXim7r80t3OY3waKWDy4zBh4njrD0yjC0BzkbTqX9C2qYNiT9BQUBuWXRI6BLotCKyH8EGDyVDV6bNO-LV66gH1LGDcP13Q-2klZIOKG6RqD_Z8pqsbfruvTwLABVebweOkL4QxYV-IzCbGBIZCh-LBN98O38rHaHx_X15C8B7HuBGn4178kBAW_5zkckmsiJ6GOyzfP7R6CorkHMBd3A333qPW_x7VUa3_6nLiwyu2lpTe7LXqL50UwMsMvdDzMQJjQ26olmQ0fNqAp43Oftiz4AfJLdmB5RbP91v3BklJI0q8939Sm93DVx6AGXlDCb2oymWwFyVpHTimsuJ2E9n8SQeSzygUsu1VMZ-o3yKZyMyxMceFrCPRyJ1pdWuwdtk9CcCkT5ahRV6YgDKxRhMQyl6XZPeGMY28sg8Cme8MeXcr9DrSJhHIsEAoj8A3PUGDykTX6qjkDcOvdqrzfV00ELxTkr8XZn-zE3Kddp-aoD6-zMT3IKVhA8vHv0Ku9hKXrgeZvcWSzprf5Qi47xTBZwkagzHLTsJ7p8l-wVmKA50zqOe7uXZSGCqdv1koBzh65qKYN1mSQTOslau9sqOKYvaX_5rhXXfwSvwRIVIu15mpoEhiQdT548MpvPeat4AltSnKhKGDU9cdv2DbXrtitJxoimefadSxt0gcYRoo'
    };

    var request = http.Request(
      'GET',
      Uri.parse('https://shalafood.net/api/v1/stores/get-stores/1'),
    );

    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);

      final List<dynamic> storesJson = data is List
          ? data
          : (data['stores'] ?? data['data'] ?? []) as List<dynamic>;

      return storesJson
          .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch stores: ${response.reasonPhrase}');
    }
  }
}
