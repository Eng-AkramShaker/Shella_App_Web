import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

class TrackingText extends StatelessWidget {
  final String mainText;
  final String subText;

  const TrackingText({
    super.key,
    required this.mainText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custom_Text(
          context,
          text: mainText,
          style: font11Black500W(context, size: size_24(context)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Custom_Text(
          context,
          text: subText,
          style: font11Black500W(context, size: size_20(context)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
