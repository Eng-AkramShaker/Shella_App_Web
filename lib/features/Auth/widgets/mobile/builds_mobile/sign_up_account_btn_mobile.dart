import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Auth/domain/models/signup_body_model.dart';
import 'package:shella_design/common/util/app_styles.dart';

class SignUpAccountButton extends StatelessWidget {
  const SignUpAccountButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.passwordController,
    required this.emailController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<AuthController>().registration(SignUpBodyModel(
                name: nameController.text,
                phone: '+966${phoneController.text}',
                password: passwordController.text,
                email: emailController.text));
          }
        },
        child: Text(
          "إنشاء الحساب",
          style: font14White600W(context),
        ),
      ),
    );
  }
}
