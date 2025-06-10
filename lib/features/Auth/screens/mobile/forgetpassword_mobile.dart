// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/helper/validate_check.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/widgets/custom_snacbar.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController phone;

  @override
  void initState() {
    super.initState();
    phone = TextEditingController();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  void _onPressedForgetPass(
      AuthController authController, BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    String number = phone.text.trim();
    // String email = '';

    // if (countryCode == '+966' && number.startsWith('0')) {
    //   number = number.substring(1);
    // }

    // String numberWithCountryCode = countryCode + number;
    // debugPrint(
    //     "\x1B[32mNumber with country code: $numberWithCountryCode\x1B[0m");

    if (number.isEmpty) {
      showCustomSnackBar('Invalid phone number', context);
      return;
    }
    authController.forgetPassword(number).then(
      (value) {
        if (value.isSuccess) {
          pushNewScreen(context, AppRoutes.mobilelVerification);
        } else {
          showCustomSnackBar(value.message, context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                custom_Images_asset(
                  image: AppImages.forgetpassword,
                  h: size.height / 3.5,
                  w: size.width / 1.5,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: size.height / 30),
                CustomPhoneInput(
                  controller: phone,
                  onChanged: (phoneNumber) {},
                  validator: (value) =>
                      ValidateCheck.validateEmptyText(value.toString(), null),
                ),
                SizedBox(height: size.height / 10),
                Consumer<AuthController>(
                  builder: (context, authController, _) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenColor,
                        minimumSize: Size(60.w, 60.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      onPressed: authController.verificationstate ==
                              AuthState.loading
                          ? null
                          : () => _onPressedForgetPass(authController, context),
                      child:
                          authController.verificationstate == AuthState.loading
                              ? SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                              : Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.r,
                                ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
