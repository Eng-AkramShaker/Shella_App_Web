import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/container/empty_%20container.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildServiceCard(String title, IconData icon, BuildContext context) {
  return Card(
    color: AppColors.wtColor,
    margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
    child: Container_Empty(
      h: 60.h,
      w: width_media(context),
      Padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Custom_Text(context, text: title, style: font14Black500W(context)),
          Icon(icon, size: 30),
        ],
      ),
    ),
  );
}
