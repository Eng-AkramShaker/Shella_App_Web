import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildCategoryButton(BuildContext context, String text, Function() onTap, Color color) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Column(
      children: [
        Custom_Text(
          context,
          text: text,
          color: AppColors.bgColor,
          style: font10Black400W(context, size: size_10(context)),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 3,
          width: MediaQuery.of(context).size.width * 0.25,
          margin: const EdgeInsets.only(top: 10),
          color: color,
        ),
      ],
    ),
  );
}
