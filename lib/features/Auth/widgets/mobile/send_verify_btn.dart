import 'package:flutter/material.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_styles.dart';

class SendVerificationCodeButton extends StatelessWidget {
  const SendVerificationCodeButton({
    super.key,
  });

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
          pushNewScreen(context, AppRoutes.confirmPasswordScreen);
        },
        child: Text(
          " إرسال",
          style: font14White600W(context),
        ),
      ),
    );
  }
}
