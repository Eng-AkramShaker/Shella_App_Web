import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool showHelper;
  const PhoneNumberField({
    super.key,
    required this.controller,
    required this.validator,
    required this.showHelper,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String _dialCode = '+966';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'رقم الهاتف',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.phone,
          validator: widget.validator,
          decoration: InputDecoration(
              hintText: '92501178889966',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              helper: widget.showHelper
                  ? Align(
                      alignment: AlignmentDirectional.centerEnd, // will respect LTR/RTL
                      child: Text(
                        'من الضروري ملئ هذه الخانة',
                        style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                      ),
                    )
                  : null,
              isDense: true,
              prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CountryCodePicker(
                  onChanged: (c) => setState(() => _dialCode = c.dialCode!),
                  initialSelection: 'SA',
                  favorite: const ['+966', 'SA'],
                  showFlag: true,
                  builder: (country) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        country!.flagUri!,
                        package: 'country_code_picker',
                        width: 24,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(country.dialCode!),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 1,
                        height: 24,
                        color: AppColors.gryColor,
                      )
                    ],
                  ),
                ),
              )),
        )
      ],
    );
  }
}
