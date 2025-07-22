import 'package:shella_design/common/local/cache_response.dart';

final database = AppDatabase();

class DbHelper {
  static Future<void> insertOrUpdate({
    required String id,
    required CacheResponseCompanion data,
  }) async {
    final response = await database.getCacheResponseById(id);
    try {
      if (response != null) {
        await database.updateCacheResponse(id, data);
      } else {
        await database.insertCacheResponse(data);
      }
    } catch (e) {
      // يمكنك تسجيل الخطأ هنا
    }
  }

  static Future<CacheResponseData?> getCacheResponseById(String id) async {
    return await database.getCacheResponseById(id);
  }
}
