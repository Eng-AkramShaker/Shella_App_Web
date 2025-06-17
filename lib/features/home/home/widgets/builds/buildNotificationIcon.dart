// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

// Notification icon with badge

Widget buildNotificationIcon(context) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      IconButton(
        icon: Image.asset(AppImages.notifications),
        onPressed: () {},
      ),
      Positioned(
        right: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: AppColors.wtColor,
          ),
          child: Custom_Text(context, text: '1', color: AppColors.primaryColor),
        ),
      ),
    ],
  );
}
