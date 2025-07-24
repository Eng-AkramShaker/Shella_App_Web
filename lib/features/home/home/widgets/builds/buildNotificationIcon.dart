// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/notifications/controllers/notifications_controller.dart';

// Notification icon with badge

Widget buildNotificationIcon(context) {
  return Consumer<NotificationsController>(
    builder: (context, notificationsController, child) {
      final int notificationsCount =
          notificationsController.myNotifications?.length ?? 0;
      final bool showLabel = notificationsCount > 0;
      return Badge(
        label: Custom_Text(context,
            text: notificationsCount.toString(),
            color: AppColors.backgroundColor,
            size: 14),
        isLabelVisible: showLabel,
        child: IconButton(
          icon: Image.asset(AppImages.notifications),
          onPressed: () {
            nav.push(AppRoutes.notifications);
          },
        ),
      );
    },
  );
}
