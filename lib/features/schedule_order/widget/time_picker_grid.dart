import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/schedule_order/widget/time_button.dart';

class TimePickerGrid extends StatelessWidget {
  final List<String> times;
  const TimePickerGrid({super.key, required this.times});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ScheduleController>(context);
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: times
          .map((time) => TimeButton(
                time: time,
                isSelected: time == controller.selectedTime,
                onTap: () => controller.updateTime(time),
              ))
          .toList(),
    );
  }
}
