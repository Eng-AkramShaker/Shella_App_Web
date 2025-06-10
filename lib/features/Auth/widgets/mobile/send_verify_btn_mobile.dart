import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';

class SendVerificationCodeButton extends StatelessWidget {
  const SendVerificationCodeButton({
    super.key,
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
                  : () => _onPressedForgetPass(authController, context),
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
}
pushNewScreen(context, AppRoutes.confirmPasswordScreen);