import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget buildProfileInfoItem(String title, String subtitle, BuildContext context,
    {Widget? trailing, Color color = AppColors.title}) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 15.sp,
      ),
    ),
    subtitle: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        subtitle,
        style: TextStyle(
          color: AppColors.supListTitle,
          fontSize: 15.sp,
        ),
      ),
    ),
  );
}
