// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/product/widgets/images/image_circle.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildHeader_Cart_details(BuildContext context, {required String img}) {
  return Container(
    height: 167.h,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.backgroundColor,
      border: Border(
        bottom: BorderSide(
          color: AppColors.gryColor_2,
          width: 1.0,
        ),
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 15,
          child: Container(
            height: 210.h,
            width: width_media(context),
            color: AppColors.backgroundColor,
            child: custom_Images_asset(image: img, h: 100.h, w: 100.w, fit: BoxFit.none),
          ),
        ),
        Positioned(
          top: 45.h,
          left: 19.w,
          right: 19.w,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 38.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButtonCircle(
                      icon: Icons.chevron_left,
                      onPressed: () {
                        popRoute(context);
                      },
                    ),
                    SizedBox(width: 15.w),
                    ImageCircle(img: AppImages.logo_23),
                    SizedBox(width: 5.w),
                    Custom_Text(context, text: " ماركت جرير", style: font13Green500W(context)),
                  ],
                ),
                Row(
                  children: [
                    IconButtonCircle(
                      icon: Icons.favorite_border,
                      onPressed: () {},
                    ),
                    SizedBox(width: 12.w),
                    IconButtonCircle(
                      icon: Icons.share,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
