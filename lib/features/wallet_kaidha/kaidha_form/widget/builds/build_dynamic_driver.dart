import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget buildDynamicDivider(bool isActive) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    child: Transform.translate(
      offset: const Offset(0, -12),
      child: Container(
        height: 3,
        width: 59,
        color: isActive ? AppColors.greenColor : AppColors.darkGreyColor,
      ),
    ),
  );
}
