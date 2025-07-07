import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

Widget buildSectionTitle_2(String title, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Custom_Text(context, text: title, style: font14Black600W(context)),
    ],
  );
}
