import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/loading_progress/loading/green_loading_circle.dart';
import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_label_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_password_field_sign_up_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_phone_field_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_text_field_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/sign_up_account_btn_mobile.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool accept = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: customAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Consumer<AuthController>(builder: (context, controller, _) {
              // Listen to the controller's state to show loading or errors
              if (controller.state == AuthState.loading) {
                return GreenLoadingCircle();
              }
              if (controller.state == AuthState.error) {
                // Show an error message to the user
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showCustomSnackBar(controller.errorMessage ?? 'Signup Failed',
                      isError: true);
                });
              }

              if (controller.state == AuthState.success) {
                // Navigate to the main layout after successful login
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  nav.pushAndRemoveUnti(AppRoutes.Login_Mobile);
                });
                return SizedBox.shrink();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(MainAppConstants.createNewAccount,
                          style: font18Black600W(context))),
                  const SizedBox(height: 10),
                  Center(
                      child: Text(MainAppConstants.pleaseFilldetailsDown,
                          style: font14Black400W(context))),
                  SizedBox(height: size.height / 30),
                  buildLabel(MainAppConstants.fullName, context),
                  buildTextField(MainAppConstants.typeFullName, nameController),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  buildLabel(MainAppConstants.email, context),
                  buildTextField(
                      MainAppConstants.typeFullEmail, emailController),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  buildLabel(MainAppConstants.phoneNumber, context),
                  buildPhoneField(phoneController),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  buildLabel(MainAppConstants.pass, context),
                  buildPasswordFieldSignUp(
                      MainAppConstants.pass, passwordController),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  buildLabel(MainAppConstants.typeAgainPassword, context),
                  buildPasswordFieldSignUp(
                      MainAppConstants.pass, confirmPasswordController),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: accept,
                        onChanged: (val) {
                          setState(() {
                            accept = !accept;
                          });
                        },
                        activeColor: AppColors.greenColor,
                      ),
                      Text(MainAppConstants.iAcceptTermsCondition),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  SignUpAccountButton(
                      formKey: formKey,
                      nameController: nameController,
                      phoneController: phoneController,
                      passwordController: passwordController,
                      emailController: emailController),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
