import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/my_points/widgets/web/offers_widgets_web.dart';
import 'package:shella_design/features/my_points/widgets/web/points_and_coupon_and_validity_web.dart';

class MyPointsWebWidget extends StatefulWidget {
  const MyPointsWebWidget({super.key});

  @override
  State<MyPointsWebWidget> createState() => _MyPointsWebWidgetState();
}

class _MyPointsWebWidgetState extends State<MyPointsWebWidget> {
  @override
  Widget build(BuildContext context) {
    // Instead of a fixed 950.w, we clamp to max 950.w but allow it to shrink on narrower screens:
    final availableWidth = MediaQuery.of(context).size.width;
    final double maxPanelWidth = 750.w;
    final double panelWidth = availableWidth >= maxPanelWidth ? maxPanelWidth : availableWidth * 0.7;

    return Center(
      child: Container(
        width: panelWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.gryColor_3, width: 2.0.w),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // If the content gets taller than available vertical space, allow scrolling:
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PointsAndCouponAndValidityWeb(),
                SizedBox(height: 20.h),
                Text(
                  'عروض رمضان',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                const OffersWidgetsWeb(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
