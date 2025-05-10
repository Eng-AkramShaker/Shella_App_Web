import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';

Widget buildBanner(context) {
  return custom_Images_asset(
      image: AppImages.baner, w: width_media(context), h: 120.h);
}
