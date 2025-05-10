import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/kaidha_form/widget/builds/build_radio_option.dart';

class JobSpecification extends StatelessWidget {
  const JobSpecification({super.key});

  @override
  Widget build(BuildContext context) {
    final kaidhaFormController = context.watch<KaidhaFormController>();
    return Column(
      children: [
        buildRadioOption(
          context: context,
          icon: Icons.business,
          mainlabel: "موظف حكومي",
          seclabel: "موظف في القطاع الحكومي",
          value: "government employee",
          groupValue: kaidhaFormController.jobSpecification,
          onChanged: (value) {
            kaidhaFormController.updatejobSpecification(value!);
          },
        ),
        SizedBox(height: 20),
        buildRadioOption(
          context: context,
          icon: Icons.shopping_bag_outlined,
          mainlabel: "موظف قطاع خاص",
          seclabel: "موظف في شركة خاصة",
          value: "private sector employee",
          groupValue: kaidhaFormController.jobSpecification,
          onChanged: (value) {
            kaidhaFormController.updatejobSpecification(value!);
          },
        ),
        SizedBox(height: 20),
        buildRadioOption(
          context: context,
          icon: Icons.home_outlined,
          mainlabel: "صاحب عمل حر",
          seclabel: "لديك مشروع خاص او عمل حر",
          value: "self-employed",
          groupValue: kaidhaFormController.jobSpecification,
          onChanged: (value) {
            kaidhaFormController.updatejobSpecification(value!);
          },
        ),
        SizedBox(height: 20),
        buildRadioOption(
          context: context,
          icon: Icons.account_circle_outlined,
          mainlabel: "متقاعد",
          seclabel: "متقاعد عن العمل",
          value: "retired",
          groupValue: kaidhaFormController.jobSpecification,
          onChanged: (value) {
            kaidhaFormController.updatejobSpecification(value!);
          },
        ),
      ],
    );
  }


}
