import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget buildAppBar(String text, {Widget? actions}) {
  return AppBar(
    backgroundColor: AppColors.greenColor,
    title: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
  );
}
