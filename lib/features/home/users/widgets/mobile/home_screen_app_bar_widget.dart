import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/addressRow/buildAddressRow.dart';
import 'package:shella_design/common/widgets/searchRow/buildSearchRow.dart';

PreferredSizeWidget? homeScreenAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(117.0.h),
    child: Container(
      color: AppColors.primaryColor,
      padding: EdgeInsets.only(bottom: 6.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: buildSearchRow(context),
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.w),
            child: buildAddressRow(context),
          ),
          SizedBox(height: 3.h),
        ],
      ),
    ),
  );
}
