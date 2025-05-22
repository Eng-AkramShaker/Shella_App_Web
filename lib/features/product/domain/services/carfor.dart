import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/features/product/domain/models/carrefour_model.dart';

class FoodCategoryService {
  Future<List<FoodCategory>> fetchFoodCategories({
    int start = 0,
    int limit = 10,
  }) async {
    var headers = {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'verify': 'false',
      'visitorid': 'FD1F26D3-EBAD-8DA7-86B1-61483584B83E',
      'storeid': 'mafsau',
      'Connection': 'keep-alive',
      'Cookie':
          'cart_api=v2; _abck=45E8CC0F9F1919EB1B4CD4AC241CD016~-1~YAAQDwLEFyja2bCWAQAAbMCl9A0wZsR61wGaPUDhrWyRz0q2ixoarGHjt+KyEPuZ5jSThWE0jpzFmg/A8A/rFDCKQT/vbI0psRaCyhOKkYjx26K0O/UolLD3rwZUGl3te7RBBnOe8qTkSvKf3qCMQfjhdokAi98s+X+u9jcpbw1wJda+wNoIelGZ3niZoEQAFt+e75VdtZAbY/QcYyFOE0Wns7RBvWpVIsBoH5AgiDDhFVlUBDcjm6rX7GXtsAxXqdqt5mI87o+ncdY1+KeF8WvCqCRh/VfPUDPzozTyu8yDomTx2afOWk1LPmhJBdj1dz6vdBU7zfgvM6cn091ncpxoZPQYOJGnBcFtKLGyvkp3T0t9vSnTOi3tQecRdfUVep85FfWsfnT1GAKX9aehHjNlPduLXq/1QoVAN7fuw48wRyvb/0dYppUBxOIWHbre9E7kz55O5T5jItqrDwpzmQ8FvtZc~-1~-1~-1; ak_bmsc=A1614EB6E45B486C4F7CC97C5E8E1DED~000000000000000000000000000000~YAAQDwLEFyna2bCWAQAAbMCl9Bs9X8rNbpmKlZSSxqvTjrOirarZr1+YCKwcsFiKeYVQqQ15Ylvt7TU28YbsG/aWcIHvMwTNPh/FIANF4hGMsacC8FDfKMQAO0cmppOv7zU+5pEjxubtCRpyqlleQT7B2IrrbOyQUsGjUZG/9/m2sS6vjPc1W2wBPtYGbullTUedjHw4jCQjvREH/dj3NtmD9GTEEvilMqi4VM4p8uT0xTJ8zHLZ8GRk7M86s/a7t6Y3mn88/fJy66tTcJj9AGd9oitOUpN93pFpNkz+cYmpx3kLmwfBuni633dg5uu93kYasi823Gf+DK6wES3ZU5ItHSWFYZM26Gd6OD7A22tP+NMfZhvMKKmK91jbgGEgJK8hlw5qiCFGWWk=; bm_sv=3BC090113453BD6EE970C3F3026336ED~YAAQDwLEF1SB3bCWAQAAfinw9BuwBLvC4KfJz5qu++TBcbM0j78t57Tf33or5eGPHrxHGRN5tMPVfcBQLJXVtx+6Aq3CRko0LauAZ+/9ERl3jTWCJYMJRLXxqegID1uyLJ+ejTKgm+ybANBoIIucGgamTwb0pWbKbSeGvgp3scJqKAR9VIVfLpTKE9Thd0bGucMJVTRBi8PZTiNZxf+wXlowXYvBtFuLQ74kuiQKmNPkkTxbO8WPGZRv1ujAwrkilas08x9w~1; bm_sz=7985AD74C23367132F8093D82A86A24D~YAAQDwLEFyra2bCWAQAAbMCl9BtTmVZfN81fTA5Ufn7YSwUKq2c25dmNgpUYApaEE9NRi4MnzwX8TTAHYQfAQAkByX3lR8ZuVI0G3rY+sgSKVZMrPDmQdW7GkzJ/aKGgu4yd9TtCS+5jHQF3nL3ux/KrsQthxTi2kC5klbnMrWQnNJUeE0y45k+d0r9ppsaF0WNLTO4wEcJVQKNFN+NLcHh+xIcvqtlTQeMXm6qGyqqxf31nlFzmrx/jONqy5kiDMtBeiL8nHFcLK3Mpp7jZuvP/yqyUc59lcdwPQM9tblWnTfGY9Xp3bjJN+V+asN+V5ndm+bmyVvEfmFBQhvCMNYApUa9EN2mGu07yF9W/fEPux59+voWLMcHjt4ihYEq8s7LDV9SBUasomtOEhCY=~4600880~4535094'
    };

    var request = http.Request(
      'GET',
      Uri.parse(
        'https://www.carrefourksa.com/api/v1/menu?lang=ar&displayCurr=SAR&latitude=24.7136&longitude=46.6753',
      ),
    );

    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonData = json.decode(responseBody);
      print(responseBody);

      final List<dynamic> categoriesJson =
          jsonData['foodCategories'] ?? jsonData['data'] ?? [];

      final paged = categoriesJson
          .skip(start)
          .take(limit)
          .map((e) => FoodCategory.fromJson(e))
          .toList();

      return paged;
    } else {
      throw Exception(
          'Failed to fetch food categories: ${response.reasonPhrase}');
    }
  }
}
