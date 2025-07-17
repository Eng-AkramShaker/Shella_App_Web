import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildTitle(String title, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.h),
    child: Custom_Text(context, text: title, style: font14Green500W(context)),
  );
}
