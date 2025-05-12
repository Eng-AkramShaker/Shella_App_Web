// Restaurant item widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';

class Shops_RestaurantItem extends StatelessWidget {
  final String image;
  final String label;

  const Shops_RestaurantItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.w),
          child: custom_Images_asset(image: image, h: 100.h, w: 100.w),
        ),
        SizedBox(height: 10.h),
        Custom_Text(context, text: label, style: font10Black600W(context)),
      ],
    );
  }
}
