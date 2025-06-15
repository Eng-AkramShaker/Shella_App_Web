// ignore_for_file: file_names

import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/features/home/home/widgets/builds/buildNotificationIcon.dart
=======
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2:lib/features/home/widgets/mobile/home/builds/buildNotificationIcon.dart
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

// Notification icon with badge

Widget buildNotificationIcon(context) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      IconButton(
        icon: SvgPicture.asset(AppImages.notifications),
        onPressed: () {},
      ),
      Positioned(
        right: 10,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.wtColor,
          ),
          child: Custom_Text(context, text: '1', color: AppColors.primaryColor,size: 11),
        ),
      ),
    ],
  );
}
