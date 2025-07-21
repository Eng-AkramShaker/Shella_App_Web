import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/drift.dart' as drift;
import 'package:shella_design/common/enums/data_source_enum.dart';
import 'package:shella_design/common/helper/db_helper.dart';
import 'package:shella_design/common/local/cache_response.dart';

class LocalClient {
  static Future<String?> organize(
      context, DataSourceEnum source, String cacheId, String? responseBody, Map<String, String>? header) async {
    final sharedPrefs = Provider.of<SharedPreferences>(context, listen: false);
    switch (source) {
      case DataSourceEnum.client:
        try {
          // print('==========cache data : endpoint banner=${cacheId}, '
          //     'header= ${header.toString()}, '
          //     'response= ${responseBody}');

          if (GetPlatform.isWeb) {
            await sharedPrefs.setString(cacheId, responseBody ?? '');
          } else {
            DbHelper.insertOrUpdate(
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
            print('=====error occure in repo api bannaer add: $e');
          }
        }
      case DataSourceEnum.local:
        try {
          if (GetPlatform.isWeb) {
            String? cacheData = sharedPrefs.getString(cacheId);
            return cacheData;
          } else {
            final CacheResponseData? cacheResponseData = await database.getCacheResponseById(cacheId);
            return cacheResponseData?.response;
          }
        } catch (e) {
          if (kDebugMode) {
            print('=====error occur in repo local banner: $e');
          }
        }
    }
    return null;
  }
}
