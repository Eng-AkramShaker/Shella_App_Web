import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_styles.dart';

Widget buildImageTitle(BuildContext context) {
  return SizedBox(
    height: 251.h,
    width: width_media(context),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        custom_Images_asset(
            image: AppImages.order_1,
            h: 225.h,
            w: width_media(context),
            fit: BoxFit.none),
        Custom_Text(context,
            text: "الرجاء اختيار نوع النقل المناسب",
            style: font14Black600W(context)),
      ],
    ),
  );
}
