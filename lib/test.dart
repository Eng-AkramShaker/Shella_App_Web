import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/schedule_order/screen/schedule_order.dart';
import 'package:shella_design/util/app_colors.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Center(child: const Text('Test Page')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
            child: custom_Button(context, title: 'Open Dialog', onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ChangeNotifierProvider(create: (_) => ScheduleController(), child: const ScheduleOrderBottomSheet()),
          );
        })),
      ),
    );
  }
}
