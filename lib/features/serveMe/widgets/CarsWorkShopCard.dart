import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/cars_services/cars_work_shop_booking_confirmation_page.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class CarsWorkShopCard extends StatelessWidget {
  const CarsWorkShopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width_media(context) / 1.2,
      child: Card(
        color: AppColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // color: AppColors.greenColor,
              // height: 244.h,
              width: width_media(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  custom_Images_asset(
                    image: 'assets/images/FRAME (31) 1.png',
                    h: 180.h,
                    w: width_media(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Custom_Text(
                              context,
                              text: 'ورشة الامان للسيارات',
                              style: font14Black500W(
                                context,
                                lineHeight: 2.5,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                custom_Images_asset(image: AppImages.icon_Star, h: 18.h, w: 18.h),
                                Custom_Text(
                                  context,
                                  text: ' 4.8',
                                  style: font14Grey400W(
                                    context,
                                    lineHeight: 2.5,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.primaryColor,
                            ),
                            Custom_Text(
                              context,
                              text: '2.5 كم',
                              style: font12Green300W(context),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Custom_Text(context, text: 'متاح اليوم من : 9 ص - 6 م', style: font10Grey400W(context)),
                            Icon(
                              Icons.alarm,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: custom_Button(
                context,
                title: "حجز موعد",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarsWorkShopBookingConfirmationPage(),
                    ),
                  );
                },
                h: 50.h,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
