import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildHeader(String title, String actionText, IconData actionIcon, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Custom_Text(context, text: title, style: font14Black500W(context)),
      Row(
        children: [
          Icon(actionIcon, color: AppColors.greenColor),
          SizedBox(width: 5.w),
          Custom_Text(context, text: actionText, style: font14Green500W(context)),
        ],
      ),
    ],
  );
}
