import 'package:flutter/material.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/util/app_colors.dart';

Widget buildStageIcon(
  IconData icon,
  int stage,
  OrderTrackingController controller,
) {
  final isActive = stage <= controller.currentStage;
  return ClipOval(
    child: Container(
      height: 32,
      width: 32,
      color: isActive ? AppColors.secondaryColor : AppColors.gryColor_5,
      child: Icon(
        icon,
        size: 14,
        color: AppColors.bgColor,
      ),
    ),
  );
}
