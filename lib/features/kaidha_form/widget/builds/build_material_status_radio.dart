import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/kaidha_form/widget/builds/build_radio_option_two.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

Widget buildMaritalStatusRadio(BuildContext context) {
  final kaidhaFormController = context.watch<KaidhaFormController>();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Custom_Text(
        context,
        text: "الحالة الاجتماعية",
        style: font11Black600W(context, size: size_14(context)),
      ),
      Row(
        children: [
          buildRadioOptionTwo(
            context: context,
            label: "أعزب",
            value: "single",
            groupValue: kaidhaFormController.maritalStatus,
            onChanged: (value) {
              kaidhaFormController.updateMaritalStatus(value!);
            },
          ),
          buildRadioOptionTwo(
            context: context,
            label: "متزوج",
            value: "married",
            groupValue: kaidhaFormController.maritalStatus,
            onChanged: (value) {
              kaidhaFormController.updateMaritalStatus(value!);
            },
          ),
          buildRadioOptionTwo(
            context: context,
            label: "مطلق",
            value: "divorced",
            groupValue: kaidhaFormController.maritalStatus,
            onChanged: (value) {
              kaidhaFormController.updateMaritalStatus(value!);
            },
          ),
        ],
      ),
    ],
  );
}
