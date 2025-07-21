// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

import 'package:shella_design/common/util/app_styles.dart';

Text Custom_Text(
  BuildContext context, {
  int? maxLines,
  TextOverflow? textOverFlow,
  TextAlign? textAlign,
  required String text,
  double? size,
  Color? color,
  bool underline = false,
  TextStyle? style,
}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: textOverFlow ?? TextOverflow.clip,
    maxLines: maxLines,
    softWrap: true,
    style: style ??
        font10Black400W(context).copyWith(
          fontSize: size ?? 10.sp,
          color: color ?? AppColors.bgColor,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
        ),
  );
}
