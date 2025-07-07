//
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/notifications/domain/models/notification_model.dart';
import 'package:shella_design/features/notifications/domain/repositories/notification_repository_interface.dart';
import 'package:shella_design/features/notifications/domain/services/notification_service_interface.dart';

class NotificationService implements NotificationServiceInterface {
  final NotificationRepositoryInterface notificationRepositoryInterface;

  NotificationService({required this.notificationRepositoryInterface});

  @override
  Future<List<NotificationModel>?> getNotificationList() async {
    try {
      http.Response? response =
          await notificationRepositoryInterface.getNotificationList();
      if (response!.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
        print(responsemap);
        return List<NotificationModel>.from(
          (responsemap as List).map(
            (e) => NotificationModel.fromJson(e),
          ),
        );
      } else {
        throw Exception('Get My Notification Failed');
      }
    } catch (e) {
      customPrint('Get My Notification Exception :: ${e.toString()}');
      throw Exception('Get My Notification Exception :: ${e.toString()}');
    }
  }
}
