// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget custom_Button(BuildContext context,
    {double? h,
    double? w,
    Color? buttoncolor,
    Color? border_color,
    TextStyle? style,
    required String title,
    required VoidCallback onPressed}) {
  return SizedBox(
    height: h ?? 62,
    width: w ?? width_media(context),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttoncolor ?? AppColors.greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: border_color ?? AppColors.greenColor, width: 1.5),
        ),
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Custom_Text(context, text: title, style: style ?? font14White400W(context)),
    ),
  );
}
