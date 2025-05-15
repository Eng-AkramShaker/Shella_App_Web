import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/appBar/mobile/customAppBar_mobile.dart';
import '../../../common/widgets/texts/custom_text.dart';
import '../../../common/util/app_colors.dart';
import '../../../common/util/app_styles.dart';
import '../widgets/offers_widgets.dart';
import '../widgets/points_and_coupon_and_validity.dart';

class MyPointsMobileWidget extends StatelessWidget {
  const MyPointsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, title: 'نقاطي', img: 'assets/images/my-points-appbar.png'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PointsAndCouponAndValidity(),
              SizedBox(
                height: 20.h,
              ),
              Custom_Text(
                context,
                text: 'عروض رمضان',
                style: font14Black500W(context),
              ),
              SizedBox(
                height: 10.h,
              ),

              // list of offers
              OffersWidgets()
            ],
          ),
        ),
      ),
    );
  }
}
