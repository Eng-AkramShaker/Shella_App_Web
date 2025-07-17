import 'package:flutter/material.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';

Widget buildActionAppBar(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 15, bottom: 5),
    decoration: BoxDecoration(
        color: AppColors.wtColor, borderRadius: BorderRadius.circular(12)),
    child: IconButton(
      splashColor: AppColors.wtColor,
      padding: EdgeInsets.zero,
      highlightColor: AppColors.wtColor,
      icon: Icon(
        Icons.mode_edit_outline_rounded,
        color: AppColors.greenColor,
        size: 24,
      ),
      onPressed: () => pushNewScreen(context, AppRoutes.updateProfileInfoPage),
    ),
  );
}
