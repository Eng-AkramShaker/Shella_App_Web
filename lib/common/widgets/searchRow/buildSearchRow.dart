// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/home/home/widgets/builds/buildNotificationIcon.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../../helper/app_routes.dart';
import '../../util/app_navigators.dart';

Widget buildSearchRow(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
          height: 46.h,
          width: 292.w,
          child: TextField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: AppColors.wGreyColor),
              hintText: "البحث عن المطاعم، الملابس، المتاجر والمزيد...",
              hintStyle: font10Grey400W(context),
              filled: true,
              fillColor: AppColors.wtColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            readOnly: true,
            onTap: () => MediaQuery.of(context).size.width > 600?pushNewScreen(context, AppRoutes.searchFilterWeb):pushNewScreen(context, AppRoutes.searchfilter),
            style: font10Black400W(context),
          ),
        ),
      ),
      SizedBox(width: 27.w),
      buildNotificationIcon(context),
    ],
  );
}
