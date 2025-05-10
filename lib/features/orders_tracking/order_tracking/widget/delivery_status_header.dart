import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

class DeliveryStatusHeader extends StatelessWidget {
  const DeliveryStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(
          context,
          text: "جاري التوصيل اليك",
          style: font10Black600W(context, size: size_14(context)),
        ),
        const SizedBox(height: 5),
        Custom_Text(
          context,
          text: "سيقوم السائق بتوصيل الطلب اليك في اقرب وقت",
          style: font10Black400W(context, size: size_11(context)),
        ),
      ],
    );
  }
}
