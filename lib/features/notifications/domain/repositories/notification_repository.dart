// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/notifications/domain/repositories/notification_repository_interface.dart';

import '../../../../api/api_client.dart';
import 'package:http/http.dart' as http;

class NotificationRepository implements NotificationRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  NotificationRepository(
      {required this.sharedPreferences, required this.apiClient});

  @override
  Future<http.Response?> getNotificationList() async {
    http.Response response =
        await apiClient.getData(Api_Constants.notificationUri);
    return response;
  }
}
