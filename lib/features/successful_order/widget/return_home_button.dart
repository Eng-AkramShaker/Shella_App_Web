import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button_2.dart';

class ReturnHomeButton extends StatelessWidget {
  const ReturnHomeButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return custom_Button(
      context,
      fontweight: FontWeight.w700,
      fontSize: 16,
      title: "العودة للصفحة الرئيسية",
      onPressed: onPressed,
    );
  }
}
