import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildService(BuildContext context) {
  return SizedBox(
      width: width_media(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Custom_Text(context, text: "أسهل طريقة للحصول على الخدمات", style: font14Black600W(context)),
          SizedBox(height: 15.h),
          Stack(
            children: [
              custom_Images_asset(image: AppImages.service_2, h: 150.h, w: width_media(context), fit: BoxFit.fill),
              custom_Images_asset(image: AppImages.service_1, h: 150.h, w: width_media(context), fit: BoxFit.fill),
            ],
          ),
        ],
      ));

  //
}
