import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_images.dart';

Image custom_Images_asset({
  required String image,
  BoxFit? fit,
  double? h,
  double? w,
  String? color
}) {
  if (image.startsWith('https')) {
    return Image.network(
      image,
      width: w ?? 75.w,
      height: h ?? 75.h,
      fit: fit ?? BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          AppImages.empty,
          width: w ?? 75.w,
          height: h ?? 75.h,
          fit: fit ?? BoxFit.cover,
        );
      },
    );
  } else {
    return Image.asset(
      image,
     // color: Colors.white,
      width: w ?? 75.w,
      height: h ?? 75.h,
      fit: fit ?? BoxFit.cover,
    );
  }
}
