import 'package:flutter/material.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_styles.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          color: AppColors.gryColor.withOpacity(0.5),
          height: 2,
          width: size.width / 3,
        ),
        Text(
          'او من خلال',
          style: font12Grey400W(context),
        ),
        Container(
          color: AppColors.gryColor.withOpacity(0.5),
          height: 2,
          width: size.width / 3,
        ),
      ],
    );
  }
}
