// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/cart/domain/models/cart_model.dart';
import 'package:shella_design/features/product/widgets/images/image_circle.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildHeader_Cart_details(BuildContext context, CartItem item) {
  return Container(
    height: 300.h,
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
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButtonCircle(
                    icon: Icons.chevron_left,
                    onPressed: () {
                    nav.back();
                    },
                  ),
                  SizedBox(width: 10.w),
                  ImageCircle(img: AppImages.logo_23),
                  SizedBox(width: 8.w),
                  Custom_Text(context,
                      text: item.item?.storeName ?? "",
                      style: font13Green500W(context)),
                ],
              ),
              Row(children: [
                IconButtonCircle(
                  icon: Icons.favorite_border,
                  onPressed: () {},
                ),
                SizedBox(width: 12.w),
                IconButtonCircle(
                  icon: Icons.share,
                  onPressed: () {},
                ),
              ]),
            ],
          ),
        ),
        Expanded(
            child: Center(
              child: Hero(
                tag: 'product-image-${item.id}',
                child: custom_Images_asset(
                  image: item.item?.image ?? AppImages.empty,
                  h: 180.h,
                  w: 180.w,
                  fit: BoxFit.contain,
                ),
              ),
            )),
      ],
    ),
  );
}