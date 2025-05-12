import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/drag_indicator.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/schedule_order/widget/day_selector.dart';
import 'package:shella_design/features/schedule_order/widget/schedule_actions.dart';
import 'package:shella_design/features/schedule_order/widget/time_picker_grid.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';

class ScheduleOrderBottomSheet extends StatelessWidget {
  const ScheduleOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.8),
      child: Container(
        decoration: _bottomSheetDecoration(),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DragIndicator(),
            const SizedBox(height: 16),
            const DaySelector(), // تمت إزالة الـ callbacks
            const SizedBox(height: 16),
            const TimePickerGrid(times: [
              '6:00 - 4:00',
              '8:00 - 6:00',
              '9:00 - 8:00',
              '11:00 - 10:00',
            ]),
            const SizedBox(height: 16),
            ScheduleActions(
              onCancel: () => popRoute(context),
              onSchedule: () {
                final controller = Provider.of<ScheduleController>(context, listen: false);
                controller.scheduleOrder();
                popRoute(context); // إغلاق البوتوم شيت بعد الحفظ
              },
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _bottomSheetDecoration() => BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      );
}
