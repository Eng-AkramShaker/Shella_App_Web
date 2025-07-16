// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/custom_snacbar.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';

class SendVerificationCodeButton extends StatelessWidget {
  final TextEditingController code;

  const SendVerificationCodeButton({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Consumer<AuthController>(
          builder: (context, authController, _) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: authController.verificationstate == AuthState.loading
                  ? null
                  : () => _onPressedsendcode(authController, context, code),
              child: authController.verificationstate == AuthState.loading
                  ? SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : Text(
                      " إرسال",
                      style: font14White600W(context),
                    ),
            );
          },
        ));
  }

  void _onPressedsendcode(AuthController authController, BuildContext context, TextEditingController code) async {
    if (code.text.isEmpty) {
      showCustomSnackBar(context, 'please enter the otp code ');
      return;
    }
    authController.verifyPhone(authController.phone!, code.text.trim()).then(
      (value) {
        if (value.isSuccess) {
          nav.push(AppRoutes.confirmPasswordScreen);
        } else {
          showCustomSnackBar(context, value.message);
        }
      },
    );
  }
}
