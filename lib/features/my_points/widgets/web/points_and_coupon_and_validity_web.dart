import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/my_points/controllers/my_points_controller.dart';
import 'package:shella_design/features/my_points/widgets/web/coupon_container_web.dart';

class PointsAndCouponAndValidityWeb extends StatefulWidget {
  const PointsAndCouponAndValidityWeb({super.key});

  @override
  State<PointsAndCouponAndValidityWeb> createState() => _PointsAndCouponAndValidityWebState();
}

class _PointsAndCouponAndValidityWebState extends State<PointsAndCouponAndValidityWeb> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Listen for error changes
    // final profileProvider = context.watch<ProfileProvider>();
    final loyaltyProvider = context.watch<LoyaltyProvider>();
    if (loyaltyProvider.error != null) {
      // Schedule showing the SnackBar after build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Widget buildErrorText() {
          if (loyaltyProvider.error != null) {
            return Text('حصل خطأ أثناء تحميل القسائم والنقاط');
          }
          return Text('حصل خطأ ما');
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: buildErrorText(),
            backgroundColor: Colors.red,
          ),
        );
        // here I'm clearing the error so it doesn’t keep showing
        // profileProvider.clearError();
        loyaltyProvider.clearError();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final profileProvider = context.watch<ProfileProvider>();
    final loyaltyProvider = context.watch<LoyaltyProvider>();
    return Column(
      children: [
        // Points and Coupons
        Row(
          children: [
            // points

            _buildPointsContainer(context, loyaltyProvider),
            SizedBox(
              width: 50.w,
            ),
            // coupons
            CouponContainerWeb(loyaltyProvider: loyaltyProvider),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        // validity
        Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(8.r), border: Border.all(width: 1, color: AppColors.orangeColor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/dangerous.svg'),
                  SizedBox(
                    width: 20.w,
                  ),
                  Custom_Text(context,
                      text: '200 نقطة تنتهي صلاحيتها في 2/2/2025',
                      style: font10Grey400W(context),
                      textOverFlow: TextOverflow.ellipsis,
                      maxLines: 1)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPointsContainer(BuildContext context, LoyaltyProvider provider) {
    if (provider.isLoading) return _loadingIndicator();
    return Expanded(
      child: InkWell(
        onTap: () {
          nav.push(AppRoutes.myPointsTransactionsScreen);
        },
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
                    Custom_Text(context, text: '${provider.user?.loyaltyPoint ?? 69} نقطة', style: font12Black400W(context)),
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
    );
  }

  Widget _loadingIndicator() => const Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ));
}
