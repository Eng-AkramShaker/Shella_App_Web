import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildStageIcon(
  IconData icon,
  int stage,
  KaidhaFormController controller,
  String text,
  BuildContext context,
) {
  final isActive = stage <= controller.currentStage;
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ClipOval(
        child: Container(
          height: 48,
          width: 48,
          color: isActive ? AppColors.greenColor : AppColors.gryColor_5,
          child: Icon(
            icon,
            size: 24,
            color: isActive ? AppColors.wtColor : AppColors.bgColor,
          ),
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        width: 120,
        child: Custom_Text(
          context,
          text: text,
          textAlign: TextAlign.center,
          style: isActive ? font12Green300W(context, size: size_10(context)) : font10Black400W(context, size: size_10(context)),
        ),
      ),
    ],
  );
}
