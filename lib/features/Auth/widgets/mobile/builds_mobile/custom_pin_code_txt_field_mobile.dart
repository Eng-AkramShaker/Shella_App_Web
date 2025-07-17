import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({
    super.key,
    required this.code,
    required this.size,
    this.onChanged, // nullable callback
  });

  final TextEditingController code;
  final Size size;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: code,
      length: 4,
      obscureText: false,
      enabled: true,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(20),
        fieldHeight: size.height / 10,
        fieldWidth: size.width / 6,
        activeFillColor: Colors.white,
        activeColor: AppColors.greenColor,
        inactiveColor: AppColors.greenColor,
        selectedColor: AppColors.greenColor,
      ),
      onChanged: (value) {
        onChanged?.call(value); // use if provided
      },
      appContext: context,
      textStyle: font14Grey400W(context),
    );
  }
}
