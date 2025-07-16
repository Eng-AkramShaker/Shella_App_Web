import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/Auth/widgets/web/login_form_web.dart';
import 'package:shella_design/common/util/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}
