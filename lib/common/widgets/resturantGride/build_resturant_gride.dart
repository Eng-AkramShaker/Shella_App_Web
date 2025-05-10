import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/home/home/widgets/restaurant_Item.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';

Widget buildRestaurantGrid(context) {
  final List<String> images = [
    AppImages.item_11,
    AppImages.item_12,
    AppImages.item_4,
    AppImages.item_13,
    AppImages.item_4,
    AppImages.item_5,
    AppImages.item_12,
    AppImages.item_15,
    AppImages.item_16,
    AppImages.item_17,
  ];

  return Container(
    width: width_media(context),
    margin: EdgeInsets.zero,
    child: Center(
      child: Wrap(
        spacing: 0,
        runSpacing: 0,
        children: List.generate(images.length, (index) {
          return Padding(
            padding: EdgeInsets.all(8.0.w),
            child: SizedBox(
              child: RestaurantItem(image: images[index]),
            ),
          );
        }),
      ),
    ),
  );
}
