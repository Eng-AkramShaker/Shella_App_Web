import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

class AddressHeaderSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const AddressHeaderSection({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (showBackButton)
              IconButton(
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20.r,
                  color: AppColors.gryColor,
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(
                  minWidth: 24.w,
                  minHeight: 24.h,
                ),
              ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          SizedBox(height: 8.h),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.gryColor_2,
            ),
          ),
        ],
        SizedBox(height: 24.h),
      ],
    );
  }
}
