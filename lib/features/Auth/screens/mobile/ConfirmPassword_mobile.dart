// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_custom_app_bar.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_label_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_mobile_change_password.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_password_field_mobile.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController passwordComfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildCustomAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size_18(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppImages.comfirempassord,
                height: size.height / 3.2,
              ),
            ),
            SizedBox(height: size_16(context)),
            Text(
              "إنشاء كلمة مرور جديدة",
              style: font18Black600W(context),
            ),
            SizedBox(height: size_14(context)),
            Text(
              "ادخل كلمة المرور الجديدة",
              style: font14Grey400W(context),
            ),
            SizedBox(height: size.height / 30),
            buildLabel("كلمة المرور", context),
            SizedBox(height: size_12(context)),
            buildPasswordField("كلمة المرور", controller: password),
            SizedBox(height: size.height / 40),
            buildLabel("ادخل كلمة المرور مرة أخرى", context),
            SizedBox(height: size_12(context)),
            buildPasswordField("اكد كلمة المرور ", controller: passwordComfirm),
            SizedBox(height: size.height / 20),
            buildMobileChangePassword(context, _onPressedChangePassword),
          ],
        ),
      ),
    );
  }

  void _onPressedChangePassword(AuthController authController, BuildContext context) async {
    if (password.text.isEmpty || passwordComfirm.text.isEmpty) {
      showCustomSnackBar(context, 'please enter the password right  ', isError: true);
      return;
    }
    // print(authController.user!.token ?? '');
    print(authController.phone!);
    authController
        .resetPassword(authController.verificationCode, authController.phone!, password.text.trim(), passwordComfirm.text.trim())
        .then(
      (value) {
        if (value.isSuccess) {
          nav.push(AppRoutes.passwordResetSuccessScreen);
        } else {
          showCustomSnackBar(context, value.message, isError: false);
        }
      },
    );
  }
}






 // SizedBox(
            //     width: double.infinity,
            //     child: Consumer<AuthController>(
            //       builder: (context, authController, _) {
            //         return ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             backgroundColor: AppColors.greenColor,
            //             padding: const EdgeInsets.symmetric(vertical: 15),
            //           ),
            //           onPressed: authController.verificationstate == AuthState.loading
            //               ? null
            //               : () => _onPressedChangePassword(
            //                     authController,
            //                     context,
            //                   ),
            //           child: authController.verificationstate == AuthState.loading
            //               ? SizedBox(
            //                   width: 24.w,
            //                   height: 24.h,
            //                   child: CircularProgressIndicator(
            //                     color: Colors.white,
            //                     strokeWidth: 3,
            //                   ),
            //                 )
            //               : Text(
            //                   "حفظ",
            //                   style: font14White600W(context),
            //                 ),
            //         );
            //       },
            //     )),