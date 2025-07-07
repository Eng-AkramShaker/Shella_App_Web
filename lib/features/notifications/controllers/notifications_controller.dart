import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/notifications/domain/models/notification_model.dart';
import 'package:shella_design/features/notifications/domain/services/notification_service_interface.dart';

enum NotificatiosState { initial, loading, success, error }

class NotificationsController with ChangeNotifier {
  final NotificationServiceInterface? notificationServiceInterface;

  NotificationsController({this.notificationServiceInterface});

  static NotificationsController get(context, {listen = true}) =>
      Provider.of<NotificationsController>(context, listen: listen);

  /// STATE VARIABLES
  NotificatiosState _notificatiosState = NotificatiosState.initial;
  NotificatiosState get notificatiosState => _notificatiosState;

  /// Notifications Data
  List<NotificationModel>? myNotifications;

  ///-------------------------------------------<<<---APIs--->>>-------------------------------------------

  /// GET My Notificatios
  Future<void> getMyNotificatios() async {
    try {
      _notificatiosState = NotificatiosState.loading;
      notifyListeners();
      print("getMyNotificatios");
      myNotifications =
          await notificationServiceInterface!.getNotificationList();
      print(myNotifications!.first);

      _notificatiosState = NotificatiosState.success;
      notifyListeners();
    } catch (e) {
      _notificatiosState = NotificatiosState.error;
      notifyListeners();
    }
  }
}
