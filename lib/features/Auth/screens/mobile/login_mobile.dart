// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/loading_progress/loading/green_loading_circle.dart';
import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/login_button_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/remember_me_row_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/sign_in_as_guest_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/sign_up_button_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/text_divider_mobile.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/sizes.dart';
import '../../controllers/auth_controller.dart';

class Login_mobile extends StatefulWidget {
  const Login_mobile({super.key});

  @override
  State<Login_mobile> createState() => _Login_mobileState();
}

class _Login_mobileState extends State<Login_mobile> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHidden = true;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Consumer<AuthController>(
                builder: (context, controller, _) {
                  // Listen to the controller's state to show loading or errors
                  if (controller.state == AuthState.loading) {
                    return GreenLoadingCircle();
                  }
                  if (controller.state == AuthState.error) {
                    // Show an error message to the user
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showCustomSnackBar(context, controller.errorMessage ?? 'Login Failed', isError: true);
                    });
                  }

                  if (controller.state == AuthState.success) {
                    // Navigate to the main layout after successful login
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      nav.pushAndRemoveUnti(AppRoutes.mainLayout);
                    });
                    return SizedBox.shrink(); // Don't show anything further
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height / 20,
                        width: size.width,
                      ),
                      custom_Images_asset(
                        image: AppImages.logo,
                        fit: BoxFit.fill,
                        w: size.width,
                        h: size.height / 4,
                      ),
                      SizedBox(
                        height: size.height / 20,
                      ),
                      CustomPhoneInput(
                        controller: phoneController,
                        onChanged: (p0) {},
                      ),
                      CustomTextField(
                        labelText: 'كلمة المرور',
                        padding: 15,
                        enableBorderColor: AppColors.gryColor_3,
                        obscureText: isHidden,
                        borderColor: AppColors.gryColor_3,
                        suffixColor: AppColors.gryColor_4,
                        borderWidth: 2,
                        controller: passwordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          icon: Icon(
                            isHidden ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                      halfHightSizedBox(size),
                      RememberMeRow(),
                      halfHightSizedBox(size),
                      LoginButton(
                          formKey: formKey, phoneController: phoneController, passwordController: passwordController, size: size),
                      halfHightSizedBox(size),
                      SignUpButton(size: size),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      TextDivider(size: size),
                      halfHightSizedBox(size),
                      SignInAsGuest(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
