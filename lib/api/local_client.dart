import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/drift.dart' as drift;

import 'package:shella_design/common/enums/data_source_enum.dart';
import 'package:shella_design/common/helper/db_helper.dart';
import 'package:shella_design/common/local/cache_response.dart';

class LocalClient {
  static Future<String?> organize(
    context,
    DataSourceEnum source,
    String cacheId,
    String? responseBody,
    Map<String, String>? header,
  ) async {
    final sharedPrefs = Provider.of<SharedPreferences>(context, listen: false);

    switch (source) {
      case DataSourceEnum.client:
        try {
          if (kIsWeb) {
            await sharedPrefs.setString(cacheId, responseBody ?? '');
          } else {
            await DbHelper.insertOrUpdate(
              id: cacheId,
              data: CacheResponseCompanion(
                endPoint: drift.Value(cacheId),
                header: drift.Value(header.toString()),
                response: drift.Value(responseBody ?? ''),
              ),
            );
          }
        } catch (e) {
          if (kDebugMode) {
            print('⚠️ Error in client data source: $e');
          }
        }
        return null; // 🔴 مهم: حتى لا يكمل إلى الحالة التالية

      case DataSourceEnum.local:
        try {
          if (kIsWeb) {
            String? cacheData = sharedPrefs.getString(cacheId);
            return cacheData;
          } else {
            final CacheResponseData? cacheResponseData = await DbHelper.getCacheResponseById(cacheId);
            return cacheResponseData?.response;
          }
        } catch (e) {
          if (kDebugMode) {
            print('⚠️ Error in local data source: $e');
          }
        }
        return null;
    }
  }
}
