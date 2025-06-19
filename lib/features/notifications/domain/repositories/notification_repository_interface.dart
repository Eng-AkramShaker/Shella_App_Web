import 'package:http/http.dart' as http;

abstract class NotificationRepositoryInterface {
  Future<http.Response?> getNotificationList();

  // void saveSeenNotificationCount(int count);
  // int? getSeenNotificationCount();
  // List<int> getNotificationIdList();
  // void addSeenNotificationIdList(List<int> notificationList);
}
