import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/schedule_order/widget/builds/build_day_button.dart';
import 'package:shella_design/features/schedule_order/widget/builds/build_day_indicator.dart';

class DaySelector extends StatelessWidget {
  const DaySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ScheduleController>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildDayButton(context, 'اليوم', controller.selectedDay, (day) => controller.updateDay(day)),
            buildDayButton(context, 'غداً', controller.selectedDay, (day) => controller.updateDay(day)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildDayIndicator('اليوم', controller.selectedDay),
            buildDayIndicator('غداً', controller.selectedDay),
          ],
        ),
      ],
    );
  }
}
