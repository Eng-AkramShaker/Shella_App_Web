import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildPromoCodeInput(BuildContext context) {
  return Container(
    height: 51.h,
    margin: EdgeInsets.only(top: 24.h),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.gryColor_4, width: 1),
      borderRadius: BorderRadius.circular(65),
      color: AppColors.wtColor,
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'برومو كود',
              hintStyle: font14Grey400W(context),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20)),
            child: Custom_Text(context,
                text: 'إدخال', style: font14White400W(context)),
          ),
        ),
        const SizedBox(width: 10),
      ],
    ),
  );
}
