import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class CustomNotesField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Color? backgroundColor;
  final int? maxLines;
  final double? elevation;

  const CustomNotesField({
    super.key,
    this.controller,
    this.hintText = "أدخل ملاحظاتك (اختياري)",
    this.backgroundColor,
    this.maxLines,
    this.elevation = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: elevation,
      child: TextField(
        maxLines: maxLines ?? 1,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: font11Grey400W(context),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
