import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/buttons/icon_button.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget buildOrderButton(
  String title,
  final Function() onPressed,
  String iconImg,
  Color iconColor, {
  Color? borderColor,
}) {
  return Icon_Button(
    title: title,
    backgroundColor: AppColors.wtColor,
    color_text: iconColor,
    icon_img: iconImg,
    icon_color: iconColor,
    border_Color: borderColor ?? Colors.transparent,
    onPressed: onPressed,
  );
}
