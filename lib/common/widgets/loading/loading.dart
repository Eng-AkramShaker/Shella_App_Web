import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.size, this.isData, this.isProfile, this.color, this.padding, this.paddingBottom});

  final double? size;
  final double? padding;
  final double? paddingBottom;
  final bool? isData;
  final bool? isProfile;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: isData == true ? 130.h : padding ?? 0, bottom: paddingBottom ?? 0),
        child: SizedBox(
            height: size ?? 25,
            width: size ?? 25,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: isData == true ? AppColors.orangeColor : color ?? AppColors.bgColor,
            )),
      ),
    );
  }
}
