import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                value,
                style: TextStyle(color: AppColors.supListTitle, fontSize: 14.sp, fontWeight: FontWeight.w400),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: AppColors.wGreyColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}