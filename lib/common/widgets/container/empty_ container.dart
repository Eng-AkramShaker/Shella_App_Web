// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget Container_Empty({
  double? h,
  double? w,
  EdgeInsets? Padding,
  required Widget child,
  Color? color,
  double? circular,
  bool border = false,
  Color? color_border,
}) {
  return Container(
    height: h,
    width: w,
    padding: Padding ?? EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(circular ?? 7)),
      border: border
          ? Border.all(color: color_border ?? AppColors.gryColor_2)
          : null,
    ),
    child: Center(
      child: child,
    ),
  );
}
