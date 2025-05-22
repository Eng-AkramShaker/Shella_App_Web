import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shella_design/common/util/app_colors.dart';

class CustomPhoneInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(PhoneNumber) onChanged;
  final String initialCountry;
  final String? errorText;

  const CustomPhoneInput({
    super.key,
    required this.controller,
    required this.onChanged,
    this.initialCountry = 'SA',
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
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
                  borderSide: BorderSide(
                      color:
                          errorText != null ? Colors.red : AppColors.gryColor_3,
                      width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color:
                          errorText != null ? Colors.red : AppColors.gryColor_3,
                      width: 2.5),
                ),
              ),
              initialCountryCode: initialCountry,
              dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.green),
              onChanged: onChanged,
            ),
            Positioned(
              right: 110,
              top: 8,
              child: Container(
                width: 1.5, // عرض الخط
                height: 40, // ارتفاع الخط
                color: AppColors.gryColor_3,
              ),
            ),
          ],
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 12),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
