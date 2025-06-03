import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/my_points/controllers/my_points_controller.dart';

class CopounContainerMobile extends StatelessWidget {
  final LoyaltyProvider provider;
  const CopounContainerMobile({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    if (provider.isLoading) return _loadingIndicator();
    return Expanded(
      child: Container(
        height: ResponsiveLayout.isWeb() ? 86.h : 45.h,
        decoration: BoxDecoration(
            color: ResponsiveLayout.isWeb() ? AppColors.lightBlue : AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(width: 1, color: AppColors.gryColor_6)),
        child: Padding(
          padding: EdgeInsets.all(3.sp),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/coupon.svg',
                width: ResponsiveLayout.isWeb() ? 48.w : 20.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              Custom_Text(context, text: '${provider.couponsCount} قسيمة', style: font12Black400W(context)),
            ],
          ),
        ),
      ),
    );
  }
  Widget _loadingIndicator() => const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
}
