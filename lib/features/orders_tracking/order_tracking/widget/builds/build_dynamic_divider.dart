import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildDynamicDivider(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Custom_Text(
          context,
          text: text,
          textAlign: TextAlign.center,
          style: font10Black600W(context, size: size_5(context)),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.bgColor,
          ),
          height: 3,
          width: 59,
        ),
      ],
    ),
  );
}
