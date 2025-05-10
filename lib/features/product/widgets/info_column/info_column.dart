import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';

class InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const InfoColumn({super.key, required this.label, required this.value, this.valueColor = AppColors.wGreyColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custom_Text(context, text: label),
        SizedBox(height: 4.h),
        Custom_Text(context, text: value, color: valueColor),
      ],
    );
  }
}
