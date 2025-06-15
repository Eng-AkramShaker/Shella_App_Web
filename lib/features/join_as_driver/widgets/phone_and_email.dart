import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../../../common/widgets/textField/custom_textfield_2.dart';

class PhoneAndEmail extends StatefulWidget {
  const PhoneAndEmail({super.key});

  @override
  State<PhoneAndEmail> createState() => _PhoneAndEmailState();
}

class _PhoneAndEmailState extends State<PhoneAndEmail> {
  bool showPassword = false;
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(context, text: 'رقم الهاتف', style: font14Black500W(context)),
        SizedBox(
          height: 10,
        ),
        CustomPhoneInput(controller: phoneController, onChanged: (number) {}),
        SizedBox(
          height: 10.h,
        ),
        Custom_Text(context, text: 'البريد الالكتروني', style: font14Black500W(context)),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          labelText: 'ادخل بريدك الالكتروني',
          borderColor: AppColors.gryColor_5,
          prefixIcon: Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 10.h,
        ),
        Custom_Text(context, text: 'كلمة المرور', style: font14Black500W(context)),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          labelText: 'كلمة المرور',
          suffixColor: AppColors.gryColor_5,
          borderColor: AppColors.gryColor_5,
          prefixIcon: Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
          obscureText: showPassword,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Custom_Text(context, text: 'ادخل كلمة المرور مرة اخرى', style: font14Black500W(context)),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          labelText: 'كلمة المرور',
          suffixColor: AppColors.gryColor_5,
          borderColor: AppColors.gryColor_5,
          prefixIcon: Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
          obscureText: showPassword,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined)),
        )
      ],
    );
  }
}
