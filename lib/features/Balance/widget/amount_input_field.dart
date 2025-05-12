import 'package:flutter/material.dart';
import 'package:shella_design/features/Balance/controller/balance_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';

class AmountInputField extends StatelessWidget {
  final BalanceController controller;
  final String hintText;
  final TextEditingController textcontroller;
  const AmountInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textcontroller,
      focusNode: controller.amountFocusNode,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.primaryColor,
      style: TextStyle(color: AppColors.bgColor),
      decoration: InputDecoration(
        hintText: hintText,
        suffixText: 'ر.س',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gryColor_5,
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
