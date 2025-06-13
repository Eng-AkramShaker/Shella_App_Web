// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../images/image_circle.dart';

Widget buildHeader(context) {
  return Stack(
    children: [
      Container(
        height: 210.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.item_66), fit: BoxFit.fill),
        ),
      ),

      // الأزرار العلوية
      Positioned(
        top: 30.h,
        left: 19.w,
        right: 19..w,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButtonCircle(
                    icon: Icons.favorite_border,
                    onPressed: () {},
                  ),
                  SizedBox(width: 15.w),
                  ImageCircle(img: AppImages.logo_23),
                  SizedBox(width: 15.w),
                  Custom_Text(context, text: "سوبر برغر", style: font12White600W(context)),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                    icon: Icons.share,
                    onPressed: () {},
                  ),
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                    icon: Icons.chevron_right,
                    onPressed: () {
                      popRoute(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
