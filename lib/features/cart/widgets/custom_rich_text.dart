import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.bgColor,
        ),
        children: [
          TextSpan(text: 'عرض نسكافيه 3*1\n'),
          TextSpan(text: '30 ظرف '),
          TextSpan(text: ' + 5 هدية', style: TextStyle(color: AppColors.secondaryColor)),
        ],
      ),
    );
  }
}
