import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildDeliveryStepTwo(BuildContext context) {
  return Container(
    height: 70.h,
    width: width_media(context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            pushNewScreen(context, AppRoutes.address_details_service_screen);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              custom_Images_asset(image: AppImages.send_2, h: 47.h, w: 100.w, fit: BoxFit.none),
              Custom_Text(context, text: "نقل باتجاه واحد", style: font11Black600W(context)),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            pushNewScreen(context, AppRoutes.address_details_service_screen);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              custom_Images_asset(image: AppImages.send_1, h: 47.h, w: 100.w, fit: BoxFit.none),
              Custom_Text(context, text: "نقل باكثر من اتجاه", style: font11Black600W(context)),
            ],
          ),
        ),
      ],
    ),
  );
}
