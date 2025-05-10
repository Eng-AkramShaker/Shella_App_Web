import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_styles.dart';

Widget buildDeliveryListView(BuildContext context) {
  return Container(
    width: width_media(context),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //

                pushNewScreen(context, AppRoutes.product);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // color: AppColors.greenColor,
                      // height: 244.h,
                      width: width_media(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          custom_Images_asset(
                              image: AppImages.icon_44,
                              h: 180.h,
                              w: width_media(context)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Custom_Text(context,
                                        text: 'سوبر برغر',
                                        style: font14Black500W(context,
                                            lineHeight: 2.5)),

                                    //

                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        custom_Images_asset(
                                            image: AppImages.icon_Star,
                                            h: 18.h,
                                            w: 18.h),

                                        //
                                        Custom_Text(context,
                                            text: ' 4.8 (50)',
                                            style: font14Grey400W(context,
                                                lineHeight: 2.5))
                                      ],
                                    ),
                                  ],
                                ),

                                //

                                Custom_Text(context,
                                    text: 'ماكولات سريعة, برغر',
                                    style: font10Grey400W(context)),

                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      custom_Images_asset(
                                          image: AppImages.icon_time,
                                          h: 18.h,
                                          w: 18.h),
                                      SizedBox(width: 8),
                                      Custom_Text(context,
                                          text:
                                              '30-45 دقيقة -  التوصيل مجاني  ',
                                          style: font10Grey400W(context)),
                                      Icon(Icons.delivery_dining,
                                          color: AppColors.secondaryColor,
                                          size: 20.w),
                                    ],
                                  ),
                                ),

                                Row(
                                  children: [
                                    custom_Images_asset(
                                        image: AppImages.icon_disc,
                                        h: 18.h,
                                        w: 18.h),
                                    SizedBox(width: 8),
                                    Custom_Text(context,
                                        text: 'خصم يصل إلى 25% عند اول طلب',
                                        style: font10Grey400W(context)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}
