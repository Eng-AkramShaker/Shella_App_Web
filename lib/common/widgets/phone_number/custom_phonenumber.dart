import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shella_design/common/util/app_colors.dart';

class CustomPhoneInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(PhoneNumber) onChanged;
  final String? Function(PhoneNumber?)? validator; // ← NEW (nullable)
  final String initialCountry;

  const CustomPhoneInput({
    super.key,
    required this.controller,
    required this.onChanged,
    this.validator, // ← NEW
    this.initialCountry = 'SA',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntlPhoneField(
          controller: controller,
          decoration: InputDecoration(
            labelText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.gryColor_4, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.gryColor_3, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.gryColor_3, width: 2.5),
            ),
          ),
          initialCountryCode: initialCountry,
          dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.green),
          onChanged: onChanged,
          validator: validator, // ← NEW
        ),
        Positioned(
          right: 110,
          top: 8,
          child: Container(
            width: 1.5,
            height: 40,
            color: AppColors.gryColor_3,
          ),
        ),
      ],
    );
  }
}
