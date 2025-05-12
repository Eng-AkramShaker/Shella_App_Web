import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class PaymentMethodChip extends StatelessWidget {
  final String text;
  const PaymentMethodChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text(
          context,
          text: "طريقه الدفع",
          style: font10Black400W(context, size: size_14(context)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 229, 246, 238),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Custom_Text(
            context,
            text: text,
            style: font12Green400W(context, size: size_16(context)),
          ),
        ),
      ],
    );
  }
}
