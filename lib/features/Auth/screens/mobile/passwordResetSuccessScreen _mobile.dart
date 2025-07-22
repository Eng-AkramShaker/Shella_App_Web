import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/features/Auth/widgets/mobile/password_reset_button.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  const PasswordResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(context),
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
              MainAppConstants.passwordChangedSuccefully,
              style: font18Black600W(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size_16(context)),
            Text(
              MainAppConstants.uCanLoginAgainThrowNewPassword,
              style: font14Grey400W(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size_18(context)),
            passwordResetButton(context,
                onPressed: () => nav.pushAndRemoveUnti(AppRoutes.Login_Mobile)),
          ],
        ),
      ),
    );
  }
}
