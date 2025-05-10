import 'package:flutter/material.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_styles.dart';

class SignInAsGuest extends StatelessWidget {
  const SignInAsGuest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        pushAndRemoveUntil(context, AppRoutes.mainLayout);
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.green),
      ),
      child: Text(
        'الدخول ك ضيف',
        style: font14Green500W(context),
      ),
    );
  }
}
