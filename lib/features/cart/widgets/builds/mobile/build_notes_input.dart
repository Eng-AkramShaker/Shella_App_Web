import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildNotesInput(
    BuildContext context, TextEditingController notesController) {
  return Card(
    color: AppColors.backgroundColor,
    child: TextField(
      maxLines: 3,
      controller: notesController,
      decoration: InputDecoration(
        hintText: "أدخل ملاحظاتك (اختياري)",
        hintStyle: font11Grey400W(context),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    ),
  );
}
