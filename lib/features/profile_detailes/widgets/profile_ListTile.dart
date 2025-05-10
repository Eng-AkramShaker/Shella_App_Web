import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/util/app_colors.dart';

Widget buildListTile(String title, IconData icon, BuildContext context, VoidCallback onTap,
    {Widget? trailing, Color color = AppColors.title}) {
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 15.sp,
      ),
    ),
    trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.wGreyColor),
    onTap: onTap,
  );
}
