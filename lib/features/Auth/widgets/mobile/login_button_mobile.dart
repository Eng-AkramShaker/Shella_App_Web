import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Auth/domain/enum/enum.dart';
import 'package:shella_design/common/util/app_styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.phoneController,
    required this.passwordController,
    required this.size,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // Trigger the login logic in the controller
          context.read<AuthController>().login(
              emailOrPhone: phoneController.text,
              password: passwordController.text,
              loginType: CentralizeLoginType.manual.name,
              fieldType: VerificationTypeEnum.phone.name);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(
          double.infinity,
          size.height / 18,
        ),
      ),
      child: Text(
        'تسجيل الدخول',
        style: font14White600W(context),
      ),
    );
  }
}
