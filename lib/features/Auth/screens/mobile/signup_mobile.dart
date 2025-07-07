import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_label_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_password_field_sign_up_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_phone_field_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_text_field_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/sign_up_account_btn_mobile.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
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
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Consumer<AuthController>(builder: (context, controller, _) {
              // Listen to the controller's state to show loading or errors
              if (controller.state == AuthState.loading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ));
              }
              if (controller.state == AuthState.error) {
                // Show an error message to the user
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(controller.errorMessage ?? 'Signup Failed')),
                  );
                });
              }

              if (controller.state == AuthState.success) {
                // Navigate to the main layout after successful login
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  pushAndRemoveUntil(context, AppRoutes.Login_Mobile);
                });
                return SizedBox.shrink();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("إنشاء حساب جديد", style: font18Black600W(context))),
                  const SizedBox(height: 10),
                  Center(child: Text("الرجاء ادخال البيانات المطلوبة بالاسفل", style: font14Black400W(context))),
                  SizedBox(height: size.height / 30),
                  buildLabel("الاسم بالكامل", context),
                  buildTextField("ادخل اسمك بالكامل", nameController),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  buildLabel("الايميل", context),
                  buildTextField("ادخل ايميلك بالكامل", emailController),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  buildLabel("رقم الهاتف", context),
                  buildPhoneField(phoneController),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  buildLabel("كلمة المرور", context),
                  buildPasswordFieldSignUp("كلمة المرور", passwordController),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  buildLabel("ادخل كلمة المرور مرة أخرى", context),
                  buildPasswordFieldSignUp("كلمة المرور", confirmPasswordController),
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
                      Text("اوافق على الشروط والأحكام وسياسة الخصوصية"),
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
