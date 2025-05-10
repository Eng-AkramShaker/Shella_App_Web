// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/util/app_styles.dart';

class Icon_Button extends StatelessWidget {
  final double? h;
  final double? w;
  final double? border_Radius;

  final String? title;
  final String? icon_img;
  final Color? backgroundColor;
  final Color? color_text;
  final Color? icon_color;
  final Color? border_Color;

  final VoidCallback onPressed;

  const Icon_Button({
    super.key,
    this.h,
    this.w,
    this.title,
    this.icon_img,
    this.color_text,
    this.backgroundColor,
    this.icon_color,
    this.border_Color,
    required this.onPressed,
    this.border_Radius,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: h ?? 22.h,
        width: w ?? 80.w,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(border_Radius ?? 7),
              border: Border.all(color: border_Color ?? Colors.transparent, width: 1),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Custom_Text(context, text: title ?? '', style: font10Black400W(context)),
                  icon_img != null ? custom_Images_asset(image: icon_img!, h: 30, w: 10, fit: BoxFit.none) : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
