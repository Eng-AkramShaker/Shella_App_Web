import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_styles.dart';

Widget buildSectionTitleTow(BuildContext context,
    {required String title, String? lapel, required bool underline}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Custom_Text(context, text: title, style: font14Black600W(context)),
      //

      Custom_Text_Button(
        context,
        text: lapel,
        underline: underline,
        text_style: font14Black500W(context),
        onPressed: () {},
      )
    ],
  );
}
