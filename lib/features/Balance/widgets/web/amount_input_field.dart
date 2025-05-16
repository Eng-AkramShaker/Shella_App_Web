import 'package:shella_design/features/Balance/controllers/balance_controller.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

class AmountInputField extends StatelessWidget {
  final BalanceController controller;
  final Color? borderSideColor;
  final Color? fillColor;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? suffixStyle;
  final EdgeInsetsGeometry? contentPadding;

  const AmountInputField({
    super.key,
    required this.controller,
    this.hintText,
    this.borderSideColor,
    this.fillColor,
    this.style,
    this.hintStyle,
    this.suffixStyle,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.additionamount,
      focusNode: controller.amountFocusNode,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.primaryColor,
      style: style ?? TextStyle(color: AppColors.bgColor),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintStyle: hintStyle,
        suffixStyle: suffixStyle,
        filled: true,
        fillColor: fillColor ?? AppColors.wtColor,
        hintText: hintText ?? 'مبلغ الشحن',
        suffixText: 'ر.س',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderSideColor ?? AppColors.gryColor_5,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
