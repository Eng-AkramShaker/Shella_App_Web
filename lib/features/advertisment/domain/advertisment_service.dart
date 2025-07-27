import 'dart:convert';
import 'package:http/http.dart' as http; // استيراد حزمة http
import 'package:shella_design/common/enums/data_source_enum.dart';
import 'package:shella_design/features/advertisment/model/advertisment_model.dart';
// الواجهة التي كانت موجودة

// الواجهة الخاصة بنا
abstract class AdvertisementServiceInterface {
  Future<List<AdvertisementModel>?> getAdvertisementList(
      DataSourceEnum dataSource,
      {int? moduleId});
}

class HttpAdvertisementService implements AdvertisementServiceInterface {
  final String _baseUrl = 'https://shalafood.net/api/v1'; // Base URL
  // يمكنك تمرير moduleId هنا أو في الدالة إذا كان يتغير
  // For now, let's pass it to the method

  HttpAdvertisementService();

  @override
  Future<List<AdvertisementModel>?> getAdvertisementList(
      DataSourceEnum dataSource,
      {int? moduleId}) async {
    // بما أن هذا Service سيقوم بالطلب الفعلي، لن نحتاج للتمييز بين local و client هنا
    // سنقوم دائمًا بطلب API الحقيقي.
    // إذا كنت لا تزال بحاجة إلى منطق التخزين المؤقت (caching)، فسيتعين عليك بناءه هنا
    // أو في طبقة Repository إذا قررت الاحتفاظ بها.

    Uri uri = Uri.parse('$_baseUrl/advertisement/list');

    // تأكد من أن moduleId ليس null، وإلا استخدم قيمة افتراضية أو قم بإدارة الخطأ
    // إذا كان moduleId_required=3, يجب أن يكون 3
    final String moduleHeaderValue =
        (moduleId ?? 3).toString(); // استخدام moduleId الممرر أو 3 كافتراضي

    try {
      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'moduled': moduleHeaderValue, // استخدام moduleId كرأس
          // أضف أي رؤوس إضافية مثل Authorization إذا كان الـ API يتطلب ذلك
        },
      );

      if (response.statusCode == 200) {
        // فحص أن الـ body هو JSON array
        List<dynamic> responseBody = jsonDecode(response.body);

        List<AdvertisementModel> advertisementList = responseBody
            .map((data) => AdvertisementModel.fromJson(data))
            .toList();

        print(
            "API Response Data: $responseBody"); // للتحقق من البيانات المستلمة
        return advertisementList;
      } else {
        print(
            'Failed to load advertisements. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return null; // أو رمي استثناء
      }
    } catch (e) {
      print('Error fetching advertisements: $e');
      return null; // أو رمي استثناء
    }
  }
}
