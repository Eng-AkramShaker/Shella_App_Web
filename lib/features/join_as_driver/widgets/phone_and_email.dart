import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/join_as_driver/controllers/join_as_driver_controller.dart';

import '../../../common/widgets/textField/custom_textfield_2.dart';

class PhoneAndEmail extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final bool showPass;
  final VoidCallback onToggleVisible;

  const PhoneAndEmail({
    super.key,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.showPass,
    required this.onToggleVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(context, text: 'رقم الهاتف'),
        SizedBox(height: 10.h),
        CustomPhoneInput(
          controller: phoneController,
          onChanged: (phone) {
            final complete = phone.countryCode + phone.number;
            context.read<DriverRegisterController>().setPhone(complete);
            debugPrint('✅ تم تحديد التليفون الكامل مرة أخرى: $complete');
          },
        ),
        SizedBox(height: 10.h),
        Custom_Text(context, text: 'البريد الإلكتروني'),
        SizedBox(height: 10.h),
        CustomTextField(
          controller: emailController,
          labelText: 'ادخل بريدك الإلكتروني',
          borderColor: AppColors.gryColor_5,
          prefixIcon: Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
          onChanged: (val) {
            context.read<DriverRegisterController>().setEmail(val.toString());
          },
        ),
        SizedBox(height: 10.h),
        Custom_Text(context, text: 'كلمة المرور'),
        SizedBox(height: 10.h),
        CustomTextField(
          controller: passwordController,
          labelText: 'كلمة المرور',
          suffixColor: AppColors.gryColor_5,
          borderColor: AppColors.gryColor_5,
          prefixIcon: Icon(Icons.lock),
          keyboardType: TextInputType.text,
          obscureText: showPass,
          suffixIcon:
              IconButton(onPressed: onToggleVisible, icon: Icon(showPass ? Icons.visibility_outlined : Icons.visibility_off_outlined)),
          onChanged: (val) {
            context.read<DriverRegisterController>().setPassword(val);
          },
        ),
        SizedBox(height: 10.h),
        Custom_Text(context, text: 'ادخل كلمة المرور مرة اخرى'),
        SizedBox(height: 10.h),
        CustomTextField(
          controller: confirmPasswordController,
          labelText: 'كلمة المرور',
          suffixColor: AppColors.gryColor_5,
          borderColor: AppColors.gryColor_5,
          prefixIcon: Icon(Icons.lock),
          keyboardType: TextInputType.text,
          obscureText: showPass,
          suffixIcon:
              IconButton(onPressed: onToggleVisible, icon: Icon(showPass ? Icons.visibility_outlined : Icons.visibility_off_outlined)),
          onChanged: (val) {},
        ),
      ],
    );
  }
}
