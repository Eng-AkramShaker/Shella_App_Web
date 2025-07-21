import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class HeaderSection extends StatelessWidget {
  final String headtext;
  final String bodytext;
  const HeaderSection(
      {super.key, required this.headtext, required this.bodytext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Custom_Text(
              context,
              text: headtext,
              style: font10Black400W(context, size: size_14(context)),
            ),
            IconButtonCircle(
              onPressed: () => Navigator.pop(context),
              icon: Icons.close,
            ),
          ],
        ),
        Custom_Text(
          context,
          text: bodytext,
          style: font10Grey400W(context, size: size_12(context)),
        ),
      ],
    );
  }
}
