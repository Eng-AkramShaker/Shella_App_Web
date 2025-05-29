import 'package:flutter/material.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_label_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_password_field_mobile.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ConfirmPasswordScreen extends StatelessWidget {

  const ConfirmPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(

            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
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
            buildPasswordField("كلمة المرور"),
            SizedBox(height: size.height / 40),
            buildLabel("ادخل كلمة المرور مرة أخرى", context),
            SizedBox(height: size_12(context)),
            buildPasswordField("كلمة المرور"),
            SizedBox(height: size.height / 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.greenColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  print('confirmPasswordScreen');
                  pushNewScreen(context, AppRoutes.passwordResetSuccessScreen);
                },
                child: Text(
                  "حفظ",
                  style: font14White600W(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
