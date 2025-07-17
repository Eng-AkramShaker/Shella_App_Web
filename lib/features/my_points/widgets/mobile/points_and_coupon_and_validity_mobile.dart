import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/my_points/controllers/my_points_controller.dart';
import 'package:shella_design/features/my_points/widgets/mobile/copoun_container_mobile.dart';
import 'package:shella_design/features/my_points/widgets/mobile/expired_point_container_mobile.dart';

class PointsAndCouponAndValidityMobile extends StatefulWidget {
  const PointsAndCouponAndValidityMobile({super.key});

  @override
  _PointsAndCouponAndValidityMobileState createState() => _PointsAndCouponAndValidityMobileState();
}

class _PointsAndCouponAndValidityMobileState extends State<PointsAndCouponAndValidityMobile> {
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
        Row(
          children: [
            _buildPointsContainer(context, loyaltyProvider),
            SizedBox(width: 50.w),
            CopounContainerMobile(
              provider: loyaltyProvider,
            ),
          ],
        ),
        SizedBox(height: 15.h),
        const ExpiredPointContainerMobile(),
      ],
    );
  }

  Widget _buildPointsContainer(BuildContext context, LoyaltyProvider provider) {
    if (provider.isLoading) return _loadingIndicator();

    // We no longer need to return an error widget here,
    // because didChangeDependencies will have shown the SnackBar.
    return Expanded(
      child: InkWell(
        onTap: () {
          nav.push(AppRoutes.myPointsTransactionsScreen);
        },
        child: Container(
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(width: 1, color: AppColors.gryColor_5),
          ),
          child: Padding(
            padding: EdgeInsets.all(3.sp),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/points.svg', width: 20.w),
                SizedBox(width: 5.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custom_Text(
                      context,
                      text: '${provider.user?.loyaltyPoint ?? 0} نقطة',
                      style: font12Black400W(context),
                    ),
                    SizedBox(height: 5.h),
                    Custom_Text(
                      context,
                      text: 'عرض السجل',
                      style: font8Black400W(context).copyWith(color: const Color(0xFF868986)),
                    ),
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
