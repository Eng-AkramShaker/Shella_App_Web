import 'package:shella_design/common/local/cache_response.dart';

final database = AppDatabase();

class DbHelper {
  static insertOrUpdate(
      {required String id, required CacheResponseCompanion data}) async {
    final response = await database.getCacheResponseById(id);

    try {
      if (response != null) {
        await database.updateCacheResponse(id, data);
      } else {
        await database.insertCacheResponse(data);
      }
    } catch (e) {}
  }
}
