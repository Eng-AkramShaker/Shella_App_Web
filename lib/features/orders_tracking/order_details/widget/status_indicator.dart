import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class StatusIndicator extends StatelessWidget {
  final String text;
  const StatusIndicator({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text(
          context,
          text: "حاله الطلب",
          style: font10Black400W(context, size: size_14(context)),
        ),
        Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 49, 163, 66),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Custom_Text(
              context,
              text: text,
              style: font10Black400W(context, size: size_14(context)),
            ),
          ],
        ),
      ],
    );
  }
}
