import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/widget/builds/build_radio_option_two.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildHousetypeRadio(BuildContext context) {
  final kaidhaFormController = context.watch<KaidhaFormController>();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Custom_Text(
        context,
        text: "نوع المنزل",
        style: font11Black600W(context, size: size_14(context)),
      ),
      SizedBox(height: 10),
      SizedBox(
        height: 30,
        child: buildRadioOptionTwo(
          context: context,
          label: "منزل دور ارضي",
          value: "ground floor house",
          groupValue: kaidhaFormController.housetype,
          onChanged: (value) {
            kaidhaFormController.updateHousetype(value!);
          },
        ),
      ),
      SizedBox(
        height: 30,
        child: buildRadioOptionTwo(
          context: context,
          label: "شقة",
          value: "apartment",
          groupValue: kaidhaFormController.housetype,
          onChanged: (value) {
            kaidhaFormController.updateHousetype(value!);
          },
        ),
      ),
      SizedBox(
        height: 30,
        child: buildRadioOptionTwo(
          context: context,
          label: "فيلا",
          value: "villa",
          groupValue: kaidhaFormController.housetype,
          onChanged: (value) {
            kaidhaFormController.updateHousetype(value!);
          },
        ),
      ),
      SizedBox(
        height: 30,
        child: buildRadioOptionTwo(
          context: context,
          label: "قصر",
          value: "palace",
          groupValue: kaidhaFormController.housetype,
          onChanged: (value) {
            kaidhaFormController.updateHousetype(value!);
          },
        ),
      ),
    ],
  );
}
