import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/loading/loading.dart';
import 'package:shella_design/features/my_coupon/controllers/my_coupon_controller.dart';
import '../../../../common/util/app_colors.dart';
import '../../../../common/widgets/appBar/customAppBar.dart';
import '../../widgets/mobile/available_container.dart';
import '../../widgets/mobile/available_coupon_widget.dart';
import '../../widgets/mobile/expired_container.dart';
import '../../widgets/mobile/expired_coupon_widget.dart';

class MyCouponMobileWidget extends StatefulWidget {
  const MyCouponMobileWidget({super.key});

  @override
  State<MyCouponMobileWidget> createState() => _MyCouponMobileWidgetState();
}

class _MyCouponMobileWidgetState extends State<MyCouponMobileWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(
        context,
        title: 'قسائمي',
        img: 'assets/images/coupon1.png',
        onPressed: () => Navigator.pop(context),
      ),
      body: MyCouponController.get(context).state == MyCouponState.loading || MyCouponController.get(context).myCouponModel == null
          ? Loading()
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                    if (index == 0) Expanded(child: AvailableCouponWidget()) else Expanded(child: ExpiredCouponWidget())
                  ],
                ),
              ),
            ),
    );
  }
}
