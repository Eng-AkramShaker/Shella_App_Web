import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildImageTitleStepTwo(BuildContext context) {
  return SizedBox(
    height: 275.h,
    width: width_media(context),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        custom_Images_asset(image: AppImages.deliv_2, h: 225.h, w: width_media(context), fit: BoxFit.none),
        Custom_Text(context, text: "جلب السعادة من الباب الى الباب", style: font14Black600W(context)),
        Custom_Text(context, text: "هل انت مستعد لنقل شيئ مميز ؟", style: font12Grey400W(context)),
      ],
    ),
  );
}
