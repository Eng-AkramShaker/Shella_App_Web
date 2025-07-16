// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

TextButton Custom_Text_Button(
  context, {
  String? text,
  double? size,
  Color? color,
  Color? backgroundColor,
  FontWeight? fontweight,
  TextStyle? text_style,
  bool underline = false,
  double? borderRadius,
  required VoidCallback onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 100),
        ),
      ),
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Custom_Text(context, text: text ?? '', style: text_style ?? font14Black500W(context)),
        if (underline)
          Positioned(
            left: 0,
            right: 0,
            bottom: -5,
            child: Container(height: 1.5, color: color ?? AppColors.bgColor),
          ),
      ],
    ),
  );
}
