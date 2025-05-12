import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/kaidha_form/widget/builds/build_radio_option_two.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildInstallmentsRadio(BuildContext context) {
  final kaidhaFormController = context.watch<KaidhaFormController>();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Custom_Text(
        context,
        text: "هل لديك اقساط",
        style: font11Black600W(context, size: size_14(context)),
      ),
      Row(
        children: [
          buildRadioOptionTwo(
            context: context,
            label: "نعم",
            value: "yes",
            groupValue: kaidhaFormController.installments,
            onChanged: (value) {
              kaidhaFormController.updateInstallments(value!);
            },
          ),
          buildRadioOptionTwo(
            context: context,
            label: "لا",
            value: "no",
            groupValue: kaidhaFormController.installments,
            onChanged: (value) {
              kaidhaFormController.updateInstallments(value!);
            },
          ),
        ],
      ),
    ],
  );
}
