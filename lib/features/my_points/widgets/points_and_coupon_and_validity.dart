import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/my_points/widgets/copoun_container.dart';
import 'package:shella_design/features/my_points/widgets/expired_point_container.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../../../common/helper/responsive_helper.dart';

class PointsAndCouponAndValidity extends StatelessWidget {
  const PointsAndCouponAndValidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Points and Coupons
        Row(
          children: [
            // points
            Expanded(
              child: Container(
                height: ResponsiveLayout.isWeb() ? 86.h : 45.h,
                decoration: BoxDecoration(
                    color: ResponsiveLayout.isWeb() ? AppColors.lightBlue : AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(width: ResponsiveLayout.isWeb() ? 2.0 : 1, color: AppColors.gryColor_6)),
                child: Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/points.svg',
                        width: ResponsiveLayout.isWeb() ? 48.w : 20.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Custom_Text(context, text: '500 نقطة', style: font12Black400W(context)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Custom_Text(context, text: 'عرض السجل', style: font8Black400W(context).copyWith(color: Color(0xFF868986))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 50.w,
            ),
            // coupons
            CopounContainer(),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        // validity
        ExpiredPointContainer()
      ],
    );
  }
}
