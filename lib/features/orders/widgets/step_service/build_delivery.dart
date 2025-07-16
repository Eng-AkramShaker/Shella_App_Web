import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildDelivery(BuildContext context) {
  return SizedBox(
    height: 126.h,
    width: width_media(context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            nav.push(AppRoutes.step_tow_service_screen);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              custom_Images_asset(image: AppImages.bike_1, h: 100.h, w: 100.w, fit: BoxFit.none),
              Custom_Text(context, text: "دراجة", style: font14Black600W(context)),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            nav.push(AppRoutes.step_tow_service_screen);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              custom_Images_asset(image: AppImages.car_1, h: 100.h, w: 100.w, fit: BoxFit.none),
              Custom_Text(context, text: "عربة نقل", style: font14Black600W(context)),
            ],
          ),
        ),
      ],
    ),
  );
}
