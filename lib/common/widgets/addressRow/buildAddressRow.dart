// Address section with icons and text
// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildAddressRow(context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 28.h,
          width: 24.w,
          child: IconButton(
            icon: Image.asset(AppImages.shape),
            onPressed: () {},
          ),
        ),
        Custom_Text(context, text: 'التوصيل الى السعودية ,شارع 112 بناء 14  ', style: font11White400W(context)),
        Icon(Icons.keyboard_arrow_down, color: AppColors.backgroundColor, size: 22.w),
      ],
    ),
  );
}
