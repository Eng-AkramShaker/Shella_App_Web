import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;

  const CategoryItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        custom_Images_asset(image: image, h: 75.h, w: 75.w),
        SizedBox(height: 6),
        Custom_Text(context, text: label, color: AppColors.gryColor_2),
      ],
    );
  }
}
