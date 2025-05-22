// Restaurant item widgets
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';

class RestaurantItem extends StatelessWidget {
  final String image;

  const RestaurantItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return custom_Images_asset(image: image, h: 50.h, w: 50.w);
  }
}
