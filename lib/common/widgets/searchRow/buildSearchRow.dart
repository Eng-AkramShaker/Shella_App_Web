// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/home/home/widgets/builds/buildNotificationIcon.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/search_filter/screen/search_filter.dart';

Widget buildSearchRow(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
          height: 46.h,
          width: 320.w,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchFilter()));
            },
            child: AbsorbPointer(
              child: TextField(
                readOnly: true,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: AppColors.greenColor),
                  hintText: "ابحث عن العناصر أو المتاجر المطلوبة",
                  hintStyle: font10Grey400W(context),
                  filled: true,
                  fillColor: AppColors.wtColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: font10Black400W(context),
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 5.w),
      buildNotificationIcon(context),
    ],
  );
}
