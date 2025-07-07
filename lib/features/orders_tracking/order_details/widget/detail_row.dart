import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class DetailRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final bool valueStyle;

  const DetailRow({
    super.key,
    required this.title,
    required this.value,
    this.isBold = false,
    this.valueStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text(
          context,
          text: title,
          style: font10Black400W(context, size: size_14(context)),
        ),
        if (valueStyle)
          Custom_Text(
            context,
            text: value,
            style: font10Black600W(context, size: size_16(context)),
          )
        else
          Custom_Text(
            context,
            text: value,
            style: isBold ? font18Black700W(context, size: size_16(context)) : font10Black400W(context, size: size_14(context)),
          ),
      ],
    );
  }
}
