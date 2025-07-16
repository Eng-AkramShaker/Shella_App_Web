// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

// Notification icon with badge

Widget buildNotificationIcon(context) {
  return Badge(
    label: Custom_Text(context, text: '1', color: AppColors.backgroundColor, size: 14),
    child: IconButton(
      icon: Image.asset(AppImages.notifications),
      onPressed: () {
        nav.push(AppRoutes.notifications);
      },
    ),
  );
}
