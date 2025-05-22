import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/my_coupon/widgets/available_container.dart';
import 'package:shella_design/features/my_coupon/widgets/expired_container.dart';

import '../../../common/widgets/appBar/mobile/customAppBar_mobile.dart';
import '../../../common/util/app_colors.dart';
import '../widgets/available_coupon_widget.dart';
import '../widgets/expired_coupon_widget.dart';

class MyCouponMobileWidget extends StatefulWidget {
  const MyCouponMobileWidget({super.key});

  @override
  State<MyCouponMobileWidget> createState() => _MyCouponMobileWidgetState();
}

class _MyCouponMobileWidgetState extends State<MyCouponMobileWidget> {
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, title: 'قسائمي', img: 'assets/images/coupon1.png'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // toggle button between applied and expired coupon
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
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
