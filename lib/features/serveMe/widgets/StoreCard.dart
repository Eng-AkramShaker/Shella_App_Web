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

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
        pushNewScreen(context, AppRoutes.serveMeProductView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white, // or your desired background
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.bgColor.withOpacity(0.2), // subtle and soft
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 0), // pushes shadow down and outward
              ),
            ],
          ),
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
                        image: AppImages.fRAME31,
                        h: 180.h,
                        w: width_media(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Custom_Text(context,
                                  text: 'متجر مربع كاف',
                                  style: font14Black500W(context,
                                      lineHeight: 2.5)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  custom_Images_asset(
                                      image: AppImages.icon_Star,
                                      h: 18.h,
                                      w: 18.h),
                                  Custom_Text(context,
                                      text: ' 4.8',
                                      style: font14Grey400W(context,
                                          lineHeight: 2.5))
                                ],
                              ),
                            ],
                          ),
                          Custom_Text(context,
                              text: 'بلال بن رباح, طويق,الرياض 12225,',
                              style: font10Grey400W(context)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.primaryColor,
                              ),
                              Custom_Text(
                                context,
                                text: ' يبعد عنك 4.9  كم ',
                                style: font12Green300W(context),
                              ),
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
      ),
    );
  }
}
