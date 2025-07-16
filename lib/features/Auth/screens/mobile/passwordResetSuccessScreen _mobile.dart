import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  const PasswordResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.blureimage,
              height: size.height / 4,
            ),
            SizedBox(height: size_16(context)),
            Image.asset(
              AppImages.comfirmpasswordchanged,
              height: size.height / 4,
            ),
            SizedBox(height: size_16(context)),
            Text(
              "تم تغيير كلمة المرور بنجاح",
              style: font18Black600W(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size_16(context)),
            Text(
              "يمكنك الدخول مجدداً عن طريق كلمة المرور الجديدة",
              style: font14Grey400W(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size_18(context)),
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
                  nav.pushAndRemoveUnti(AppRoutes.Login_Mobile);
                },
                child: Text(
                  "تم",
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
