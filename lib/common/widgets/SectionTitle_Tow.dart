import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildSectionTitleTwo({
  required String title,
  String? label,
  required bool underline,
  required BuildContext context,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Custom_Text(context, text: title, style: font14Black600W(context)),

      // Only show the button if label is not null
      if (label != null)
        Custom_Text_Button(
          context,
          text: label,
          underline: underline,
          text_style: font14Black500W(context),
          onPressed: () {},
        ),
    ],
  );
}
