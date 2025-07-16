import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class Fees extends StatelessWidget {
  const Fees({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Custom_Text(context, text: "رسوم الخدمة", style: font10Black400W(context, size: size_13(context))),
              Custom_Text(context, text: " 150 ريال", style: font11Black500W(context, size: size_12(context)))
            ],
          ),
          Divider(color: AppColors.bgColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Custom_Text(context, text: "رسوم اضافية", style: font10Black400W(context, size: size_13(context))),
              Custom_Text(context, text: " 25 ريال", style: font11Black400W(context, size: size_13(context)))
            ],
          ),
          Divider(color: AppColors.bgColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Custom_Text(context, text: "الإجمالي", style: font10Black400W(context, size: size_13(context))),
              Custom_Text(context, text: " 175 ريال", style: font12Green400W(context, size: size_13(context)))
            ],
          ),
        ],
      ),
    );
  }
}
