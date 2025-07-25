import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ApplyButton extends StatelessWidget {
  final void Function() onTap;
  const ApplyButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.h,
      decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(8.r)),
      child: Custom_Text_Button(
        context,
        text_style: font14White500W(context),
        onPressed: onTap,
        text: 'يقدم',
      ),
    );
  }
}
