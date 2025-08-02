import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

Widget buildSectionTitleTow(BuildContext context,
    {required String title,
    String? lapel,
    String? iconUrl,
    required bool underline,
    bool? icon}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Custom_Text(context, text: title, style: font14Black600W(context)),
          const SizedBox(width: 6),
          icon == true
              ? Image.asset(
                  iconUrl!,
                  height: 25,
                )
              : SizedBox.shrink(),
        ],
      ),

      //

      Custom_Text_Button(
        context,
        text: lapel,
        underline: underline,
        // text_style: font14Black500W(context),
        text_style: TextStyle(color: Colors.grey),
        onPressed: () {},
      )
    ],
  );
}
