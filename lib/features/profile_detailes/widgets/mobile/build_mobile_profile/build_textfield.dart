import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget buildTextField(
    TextEditingController controller, String label, IconData icon,
    {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    controller: controller,
    validator: (value) {
      if (label.contains('البريد') && value!.isEmpty) {
        return 'هذا الحقل مطلوب';
      }
      return null;
    },
    cursorColor: AppColors.greenColor,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 16.sp,
        color: AppColors.wGreyColor,
      ),
      prefixIcon: Icon(icon, color: AppColors.greenColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.wGreyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.wGreyColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.greenColor),
      ),
    ),
  );
}
