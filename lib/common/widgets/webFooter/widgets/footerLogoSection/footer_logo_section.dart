import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_images.dart';
import '../../../images/custom_Images.dart';

class FooterLogoSection extends StatelessWidget {
  const FooterLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        custom_Images_asset(
          image: AppImages.logo,
          h: 60.h,
          w: 35.w,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 50.w,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "شلة منشأة سعودية مرخصة من قبل وزارة التجارة لممارسة النشاط التسويقي للغير و بيع التجزئة والجملو للافراد والمنشئات بسجل تجاري رقم",
                  style: TextStyle(
                    color: AppColors.bgColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: "1009128112",
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "برأس مال 50 مليون ريال سعودي",
                      style: TextStyle(
                        color: AppColors.bgColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]
                ),
              ],
            ),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        )
      ],
    );
  }
}