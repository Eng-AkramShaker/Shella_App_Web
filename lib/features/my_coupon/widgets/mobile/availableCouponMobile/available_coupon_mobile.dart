import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/button/custom_button.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import '../../../../../common/util/app_colors.dart';
import '../../../../../common/util/app_styles.dart';
import '../../../../../common/widgets/gap/height/height.dart';
import '../../../../../common/widgets/texts/custom_text.dart';
import '../../../../../common/widgets/texts/text_button.dart';
import '../../../controllers/my_coupon_controller.dart';

class AvailableCouponMobile extends StatelessWidget {
  const AvailableCouponMobile({super.key, required this.index, this.discount, this.expiredDate});

  final int index;
  final dynamic? discount;
  final String? expiredDate;

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.grey.withValues(alpha: 0.2), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 2, // Blur radius
                  offset: Offset(0, 0), // Offset from the container
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColors.gryColor_7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Custom_Text(context,text: discount.toString(), style: font16SecondaryColor400W(context,size: 17).copyWith(color: AppColors.secondaryColor)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Custom_Text(context,text: 'بدون حد ادنى', style: font12SecondaryColor400W(context,size: 14).copyWith(color: AppColors.secondaryColor)),
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
                          Custom_Text(context, text: 'خصم  30% وفر حتى 20 ر.س', style: font12Black400W(context,size: 10).copyWith(color:  AppColors.bgColor)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), border: Border.all(width: 1, color: AppColors.secondaryColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Custom_Text(context, text: 'طلبات التوصيل فقط', style: font6SecondaryColor400W(context,size: 8).copyWith(color:  AppColors.secondaryColor)),
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), border: Border.all(width: 1, color: AppColors.secondaryColor)),
                            child: Padding(padding: const EdgeInsets.all(8.0), child: Custom_Text(context, text: 'خصم يصل الى 20ر.س', style: font6SecondaryColor400W(context,size: 8).copyWith(color:  AppColors.secondaryColor)),),
                          ),
                          SizedBox(height: 10.h,),
                          Custom_Text(context, text: 'صالح حتى $expiredDate', style: font8Black400W(context,size: 10).copyWith(color:  AppColors.bgColor)),
                          if(MyCouponController.get(context).availableCoupons![index].storeId!=null)
                          Padding(
                            padding: EdgeInsets.only(left: 10,right: width(context, 0.35)),
                            child: CustomButton(onTap: () => MyCouponController.get(context,listen: false).applyCoupon(code: MyCouponController.get(context,listen: false).availableCoupons![index].code,storeId: MyCouponController.get(context,listen: false).availableCoupons![index].storeId),height: 27,width: width(context, 0.17),text: 'استخدام',color: AppColors.secondaryColor,colorTxt: AppColors.wtColor,textSize: 7.sp,isLoading: MyCouponController.get(context).applyCouponState==MyCouponState.loading,loadingColor: AppColors.wtColor,loadingSize: 15,),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: -30,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: AppColors.wtColor, shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2), // Shadow color
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
