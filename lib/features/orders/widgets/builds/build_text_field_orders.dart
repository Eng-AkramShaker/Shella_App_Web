import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_styles.dart';

Widget buildTextField(String label , BuildContext context , TextEditingController notesController ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Custom_Text(context, text: label, style: font14Green500W(context)),
      SizedBox(height: 10.h),
      CustomNotesField(controller: notesController, hintText: label),
      SizedBox(height: 16.h),
    ],
  );
}
