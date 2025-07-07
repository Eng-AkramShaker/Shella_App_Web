import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/notifications/controllers/notifications_controller.dart';
import 'package:shella_design/features/notifications/widgets/builds/notifications_componnent.dart';
import 'package:shella_design/features/notifications/widgets/notification_card.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final provider = NotificationsController.get(context, listen: false);
    provider.getMyNotificatios();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        foregroundColor: AppColors.backgroundColor,
        backgroundColor: AppColors.greenColor,
        elevation: 0,
        centerTitle: true,
        title: Custom_Text(
          context,
          text: "مركز الاشعارات",
          color: AppColors.backgroundColor,
          style: font12White700W(context, size: size_14(context)),
          size: 20,
        ),
      ),
      body: NotificationsComponnent(),
    );
  }
}
