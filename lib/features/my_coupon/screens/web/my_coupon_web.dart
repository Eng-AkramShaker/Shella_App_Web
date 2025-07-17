import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/features/my_coupon/controllers/my_coupon_controller.dart';
import 'package:shella_design/features/my_coupon/widgets/web/expiredCouponWeb/expired_coupon_web.dart';
import '../../../../common/util/app_colors.dart';
import '../../../../common/widgets/gap/height/height.dart';
import '../../widgets/mobile/available_container.dart';
import '../../widgets/mobile/expired_container.dart';
import '../../widgets/web/availableCouponWeb/available_coupon_web.dart';

class MyCouponWeb extends StatefulWidget {
  const MyCouponWeb({super.key});

  @override
  State<MyCouponWeb> createState() => _MyCouponWebState();
}

class _MyCouponWebState extends State<MyCouponWeb> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context, 1) > 600 ? width(context, 0.7) : width(context, 0.9),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5), // Shadow color
                      spreadRadius: 0, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Offset from the container
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.sp),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          int i = 0;
                          setState(() {
                            index = i;
                          });
                        },
                        child: AvailableContainer(index: index),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          int i = 1;
                          setState(() {
                            index = i;
                          });
                        },
                        child: ExpiredContainer(index: index),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              MyCouponController.get(context).state == MyCouponState.loading || MyCouponController.get(context).myCouponModel == null
                  ? LinearProgressIndicator(
                      color: AppColors.greenColor,
                      backgroundColor: AppColors.greenColor.withValues(alpha: 0.2),
                    )
                  : (index == 0)
                      ? AvailableCouponWeb()
                      : ExpiredCouponWeb()
            ],
          ),
        ),
      ),
    );
  }
}
