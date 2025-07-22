import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildNotesInput(
<<<<<<<< HEAD:lib/features/cart/widgets/mobile/builds/build_notes_input.dart
    BuildContext context, TextEditingController notesController,
    {required Function(String) onChanged}) {
========
    BuildContext context, TextEditingController notesController) {
>>>>>>>> 93e16ca64e991487f2431e7c68ebbd34043ca0f4:lib/features/cart/widgets/builds/mobile/build_notes_input.dart
  return Card(
    color: AppColors.backgroundColor,
    child: TextField(
      maxLines: 3,
      controller: notesController,
      onChanged: onChanged,
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
