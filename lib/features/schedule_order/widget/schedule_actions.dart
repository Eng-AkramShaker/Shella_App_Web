import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button_2.dart';

class ScheduleActions extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSchedule;

  const ScheduleActions({
    super.key,
    required this.onCancel,
    required this.onSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 16),
        Expanded(
          child: custom_Button(context,
              borderwidth: 1,
              bordersidecolor: AppColors.gryColor_3,
              buttoncolor: AppColors.backgroundColor,
              textcolor: AppColors.bgColor,
              h: 36,
              title: "إلغاء",
              onPressed: onCancel),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: custom_Button(context, h: 36, title: "جدولة", onPressed: onSchedule),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
