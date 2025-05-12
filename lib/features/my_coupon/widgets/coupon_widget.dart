import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/widgets/texts/text_button.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../../../common/util/app_colors.dart';
import '../domain/models/my_coupon_models.dart';

class buildCouponList extends StatelessWidget {
  final int index;
  final List<Coupon> list;
  const buildCouponList({super.key, required this.index, required this.list});

  @override
  Widget build(BuildContext context) {
    final coupon = list[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.wtColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 2, // Blur radius
                  offset: Offset(0, 0), // Offset from the container
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: ResponsiveLayout.isWeb() ? 200.h : 160.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColors.gryColor_7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Custom_Text(context,
                            text: '30 % خصم',
                            style: font16SecondaryColor400W(context)
                                .copyWith(color: coupon.isAvailable == false ? AppColors.darkGreyColor : AppColors.secondaryColor)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Custom_Text(context,
                            text: 'بدون حد ادنى',
                            style: font12SecondaryColor400W(context)
                                .copyWith(color: coupon.isAvailable == false ? AppColors.darkGreyColor : AppColors.secondaryColor)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(context,
                            text: 'خصم 50% وفر حتى 20 ر.س',
                            style: font12Black400W(context)
                                .copyWith(color: coupon.isAvailable == false ? AppColors.darkGreyColor : AppColors.bgColor)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1, color: coupon.isAvailable ? AppColors.secondaryColor : AppColors.darkGreyColor)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Custom_Text(context,
                                text: 'طلبات التوصيل فقط',
                                style: font6SecondaryColor400W(context).copyWith(
                                    color: coupon.isAvailable == false ? AppColors.darkGreyColor : AppColors.secondaryColor)),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1, color: coupon.isAvailable ? AppColors.secondaryColor : AppColors.darkGreyColor)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Custom_Text(context,
                                text: 'خصم يصل الى 20ر.س',
                                style: font6SecondaryColor400W(context).copyWith(
                                    color: coupon.isAvailable == false ? AppColors.darkGreyColor : AppColors.secondaryColor)),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Custom_Text(context,
                            text: 'صالح حتى 20/3/2025 11:59 م.',
                            style: font8Black400W(context)
                                .copyWith(color: coupon.isAvailable == false ? AppColors.darkGreyColor : AppColors.bgColor)),
                        coupon.isAvailable
                            ? ResponsiveLayout.isWeb()
                                ? Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: TextButtonWidget(
                                      onPressed: () {},
                                      verticalPadd: 0,
                                      height: 50.h,
                                      width: 155.w,
                                      horizontalPadd: 10,
                                      text: 'استخدام',
                                      radius: 8.r,
                                      textStyle: font10SecondaryColor600W(context),
                                      backgroundColor: AppColors.backgroundColor,
                                      borderColor: AppColors.secondaryColor,
                                      borderWidth: 2.0,
                                    ),
                                  )
                                : Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: TextButtonWidget(
                                      onPressed: () {},
                                      verticalPadd: 0,
                                      height: 30.h,
                                      width: 60.w,
                                      horizontalPadd: 10,
                                      text: 'استخدام',
                                      radius: 16.r,
                                      textStyle: font10White400W(context),
                                      backgroundColor: AppColors.secondaryColor,
                                    ),
                                  )
                            : Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: -42,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: AppColors.wtColor, shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 2, // Blur radius
                  offset: Offset(0, 0), // Offset from the container
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
