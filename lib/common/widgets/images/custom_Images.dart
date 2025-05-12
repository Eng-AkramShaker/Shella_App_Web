// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_images.dart';

Image custom_Images_asset({required String image, BoxFit? fit, double? h, double? w}) {
  return image != null
      ? Image.asset(image, width: w ?? 75.w, height: h ?? 75.h, fit: fit ?? BoxFit.fill)
      : Image.asset(AppImages.empty, width: w ?? 75.w, height: h ?? 75.h);
}
