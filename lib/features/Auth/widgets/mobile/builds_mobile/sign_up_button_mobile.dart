import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_styles.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        nav.push(AppRoutes.signup);
      },
      style: OutlinedButton.styleFrom(
        minimumSize: Size(
          double.infinity,
          size.height / 18,
        ),
        side: BorderSide(color: Colors.green),
      ),
      child: Text(
        'إنشاء حساب',
        style: font14Green500W(context),
      ),
    );
  }
}
