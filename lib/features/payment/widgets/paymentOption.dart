import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/container/empty_%20container.dart';
import 'package:shella_design/common/widgets/divider/custom_divider.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget paymentOption(
  BuildContext context, {
  double? h,
  double? w,
  TextStyle? style,
  required String image,
  required String title,
  required String description,
  required String buttonTitle,
  Color? buttonColor,
  Color? borderColor,
  bool hasIcon = false,
  required Function() onPressed,
}) {
  return Column(
    children: [
      Container_Empty(
        h: 70.h,
        w: width_media(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                custom_Images_asset(
                  image: image,
                  h: h ?? 30.h,
                  w: w ?? 25.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Custom_Text(
                          context,
                          text: title,
                          style: font11Grey400W(context),
                        ),
                        if (hasIcon) ...[
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.error_outline,
                            color: AppColors.gryColor_2,
                          ),
                        ],
                      ],
                    ),
                    Custom_Text(
                      context,
                      text: description,
                      style: font10Black600W(context),
                    ),
                  ],
                ),
              ],
            ),
            if (buttonTitle.isNotEmpty)
              custom_Button(
                context,
                h: 40.h,
                w: buttonTitle.length > 5 ? 70.w : 40.w,
                title: buttonTitle,
                buttoncolor: buttonColor!,
                border_color: borderColor!,
                style: style ?? font10Grey400W(context),
                onPressed: onPressed,
              ),
          ],
        ),
      ),
      SizedBox(height: 1.h),
      Custom_Divider(),
      SizedBox(height: 10.h),
    ],
  );
}
