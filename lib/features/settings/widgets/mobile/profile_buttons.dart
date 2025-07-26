import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

import '../../../../common/widgets/loading_progress/loading/custom_loading.dart';


class ProfileButton extends StatelessWidget {
  ProfileButton({
    super.key,
    required this.title,
    required this.onTap,
    this.backGroundColor = AppColors.greenColor,
    this.foreGroundColor = AppColors.wtColor,
    this.horizontalPadding = 10,
    this.textFontSize = 15,
    this.isAnimated = false,
    this.isLoading = false,
    this.begin = -1,
    this.elevation,
    this.borderRadius,
  });

  final String title;
  final Function() onTap;
  final Color backGroundColor;
  final Color foreGroundColor;
  final double horizontalPadding;
  final double textFontSize;
  final bool isAnimated;
  final bool isLoading;
  final double begin;
  final double? elevation;
  final double? borderRadius;
  final List effects = [];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: backGroundColor,
        foregroundColor: foreGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 12,
          ),
        ),
      ),
      onPressed: isLoading ? () {} : onTap,
      child: Padding(
          padding: EdgeInsets.symmetric(
            // vertical: isLoading ? 0.016.sh : 0.012.sh,
              vertical: 0.016.sh,
              horizontal: horizontalPadding),
          child: isLoading
              ? const CustomLoading(
            color: AppColors.wtColor,
          )
              : Text(
            title,
            style: TextStyle(
              color: foreGroundColor,
              fontSize: textFontSize,
            ),
          )),
    );
  }
}