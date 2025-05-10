import 'package:flutter/material.dart';
import 'package:shella_design/features/orders/widgets/order_Button.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_navigators.dart';

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
          pushNewScreen(context, AppRoutes.start_tracking_order);
        },
        AppImages.order,
        AppColors.bgColor,
        borderColor: AppColors.secondaryColor,
      ),
    ],
  );
}
