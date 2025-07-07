import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield.dart';

Widget buildDoubleTextField(String label1, String label2, TextEditingController notesController) {
  return Row(
    children: [
      Expanded(
          child:
              CustomNotesField(controller: notesController, hintText: label1)),
      SizedBox(width: 10.w),
      Expanded(
          child:
              CustomNotesField(controller: notesController, hintText: label2)),
    ],
  );
}
