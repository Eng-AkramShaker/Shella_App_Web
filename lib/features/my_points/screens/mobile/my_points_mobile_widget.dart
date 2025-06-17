import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/my_points/widgets/mobile/offers_widgets_mobile.dart';
import '../../../../common/widgets/appBar/customAppBar.dart';
import '../../../../common/widgets/texts/custom_text.dart';
import '../../../../common/util/app_colors.dart';
import '../../../../common/util/app_styles.dart';
import '../../widgets/mobile/points_and_coupon_and_validity_mobile.dart';

class MyPointsMobileWidget extends StatelessWidget {
  const MyPointsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, title: 'نقاطي', img: 'assets/images/my-points-appbar.png'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PointsAndCouponAndValidityMobile(),
                    SizedBox(height: 20.h),
                    Custom_Text(
                      context,
                      text: 'عروض رمضان',
                      style: font14Black500W(context),
                    ),
                    SizedBox(height: 10.h),
                    // Add constrained container for offers list
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 0,
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                      ),
                      child: const OffersWidgetsMobile(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}