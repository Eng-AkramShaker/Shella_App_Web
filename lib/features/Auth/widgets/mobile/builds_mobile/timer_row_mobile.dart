import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class TimerRow extends StatelessWidget {
  const TimerRow({
    super.key,
    required this.controller,
    required this.endTime,
  });

  final CountdownTimerController controller;
  final int endTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CountdownTimer(
          textStyle: font14Grey400W(context),
          controller: controller,
          endTime: endTime,
          widgetBuilder: (_, time) {
            if (time == null) {
              return Text("00:00", style: font14Grey400W(context));
            }
            String minutes = (time.min ?? 0).toString().padLeft(2, '0');
            String seconds = (time.sec ?? 0).toString().padLeft(2, '0');
            return Text("$minutes:$seconds", style: font14Grey400W(context));
          },
        ),
        Icon(
          Icons.alarm,
          color: AppColors.gryColor_2,
          size: 25,
        ),
      ],
    );
  }
}
