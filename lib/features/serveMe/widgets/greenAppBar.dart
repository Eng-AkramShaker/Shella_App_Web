import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

AppBar greenAppBar(
  BuildContext context,
  String title,
) {
  return AppBar(
    centerTitle: true,
    // elevation: 0,
    scrolledUnderElevation: 0,
    title: Text(
      title,
      style: font14White600W(context),
    ),
    backgroundColor: AppColors.primaryColor,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 30,
        color: AppColors.backgroundColor,
      ),
    ),
  );
}
