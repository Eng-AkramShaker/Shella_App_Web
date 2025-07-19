import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle? style;

  const CustomButtonOnBoarding({
    super.key,
    this.style,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 62,
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
            textColor: AppColors.backgroundColor,
            onPressed: onPressed,
            color: AppColors.primaryColor,
            child: Custom_Text(
              context,
              text: text,
              color: AppColors.backgroundColor,
              style: font12White500W(context, size: size_16(context)),
            ),
          ),
        ),
      ],
    );
  }
}
