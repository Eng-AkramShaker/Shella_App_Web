// Restaurant item widget
import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';

class MarketItem extends StatelessWidget {
  final String image;

  const MarketItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return custom_Images_asset(image: image, h: 50.h, w: 50.w);
  }
}
