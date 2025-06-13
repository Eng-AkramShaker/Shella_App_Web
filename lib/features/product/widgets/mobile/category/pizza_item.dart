import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class PizzaItem extends StatelessWidget {
  final VoidCallback onTap;

  const PizzaItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 105.h,
        width: width_media(context),
        margin: EdgeInsets.only(bottom: 24.h),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ------------------------- النصوص
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Custom_Text(context, text: "دبل تشيز برغر", style: font14Black500W(context)),
                    Custom_Text(context, text: "جبنة, ذرة ,فطر\nصلصة,سلامي, اوريغانو.....", style: font10Grey400W(context)),
                    Custom_Text(context, text: "50 ريال", style: font10SecondaryColor600W(context)),
                  ],
                ),
              ),
            ),

            // ------------------------ الصوره
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(AppImages.item_10, height: 110.h, width: 110.w, fit: BoxFit.fill),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
