// import 'package:flutter/material.dart';import 'package:shella_design/common/util/navigation/navigation.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shella_design/common/util/app_colors.dart';
//
// class DialogButtons extends StatelessWidget {
//   const DialogButtons({
//     super.key,
//     required this.title,
//     required this.onTap,
//     this.backGroundColor = AppColors.greenColor,
//     this.foreGroundColor = AppColors.wtColor,
//     this.horizontalPadding = 10,
//     this.textFontSize = 15,
//     this.isLoading = false,
//     this.elevation,
//     this.borderRadius = 12,
//   });
//
//   final String title;
//   final VoidCallback onTap;
//   final Color backGroundColor;
//   final Color foreGroundColor;
//   final double horizontalPadding;
//   final double textFontSize;
//   final bool isLoading;
//   final double? elevation;
//   final double borderRadius;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         elevation: elevation,
//         backgroundColor: backGroundColor,
//         foregroundColor: foreGroundColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//       ),
//       onPressed: isLoading ? null : onTap,
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: 0.016.sh,
//           horizontal: horizontalPadding,
//         ),
//         child: isLoading
//             ? const CircularProgressIndicator(color: Colors.white)
//             : Text(
//                 title,
//                 style: TextStyle(fontSize: textFontSize),
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_loading.dart';

import '../../../common/util/app_colors.dart';

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
              ? const ProfileLoading(
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
