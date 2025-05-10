import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/container/empty_%20container.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

Widget buildLocationCard(BuildContext context) {
  return Card(
    color: AppColors.wtColor,
    margin: EdgeInsets.zero,
    child: Container_Empty(
      h: 60.h,
      w: width_media(context),
      Padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.home, size: 35, color: AppColors.greenColor),
              SizedBox(width: 13.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Custom_Text(context,
                      text: "المنزل", style: font14Black400W(context)),
                  Custom_Text(context,
                      text: "السعودية , الرياض 55552333",
                      style: font13Grey400W(context)),
                ],
              ),
            ],
          ),
          Icon(Icons.keyboard_arrow_down, size: 30),
        ],
      ),
    ),
  );
}
