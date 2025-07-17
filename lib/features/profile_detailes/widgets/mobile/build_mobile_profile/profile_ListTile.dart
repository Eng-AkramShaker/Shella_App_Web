import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget buildListTile(
    String title, Widget leading, BuildContext context, VoidCallback onTap,
    {Widget? trailing, Color color = AppColors.title}) {
  return ListTile(
    leading: leading,
    title: Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 15.sp,
      ),
    ),
    trailing: trailing ??
        Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.wGreyColor),
    onTap: onTap,
  );
}
