import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        custom_Button(
          h: 35,
          w: 120,
          context,
          title: "تتبع الطلب",
          onPressed: () {},
          style: font10White400W(context, size: size_16(context)),
        ),
        custom_Button(
          h: 35,
          w: 120,
          context,
          buttoncolor: AppColors.backgroundColor,
          title: "ألغاء الطلب",
          onPressed: () {},
          style: font12Green400W(context, size: size_16(context)),
        ),
      ],
    );
  }
}
