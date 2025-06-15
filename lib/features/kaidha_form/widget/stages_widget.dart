import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/kaidha_form/widget/builds/build_dynamic_driver.dart';
import 'package:shella_design/features/kaidha_form/widget/builds/build_stage_icon.dart';


class StagesWidget extends StatelessWidget {
  const StagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<KaidhaFormController>(context);

    return Column(
      children: [
        SizedBox(
          height: 120,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: buildStageIcon(
                  Icons.menu,
                  1,
                  controller,
                  "المعلومات الشخصية والعقد",
                  context,
                ),
              ),
              buildDynamicDivider(controller.currentStage > 1),
              Expanded(
                child: buildStageIcon(
                  Icons.money,
                  2,
                  controller,
                  "التحقق من مصدر\nالدخل",
                  context,
                ),
              ),
              buildDynamicDivider(controller.currentStage > 2),
              Expanded(
                child: buildStageIcon(
                  Icons.notifications_active_outlined,
                  3,
                  controller,
                  "في انتظار تفعيل\nمحفظة قيدها",
                  context,
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 0.5),
      ],
    );
  }



}
