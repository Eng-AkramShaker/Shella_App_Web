import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/orders/widgets/order_Button.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';

Widget buildOrderButtons(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildOrderButton(
        "قيد الموافقة",
        () {},
        AppImages.dot,
        AppColors.primaryColor,
      ),
      buildOrderButton(
        "تتبع الطلب ",
        () {
          nav.push(AppRoutes.start_tracking_order);
        },
        AppImages.order,
        AppColors.bgColor,
        borderColor: AppColors.secondaryColor,
      ),
    ],
  );
}
