import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_styles.dart';

class SignInAsGuest extends StatelessWidget {
  const SignInAsGuest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        nav.pushAndRemoveUnti(AppRoutes.mainLayout);
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
