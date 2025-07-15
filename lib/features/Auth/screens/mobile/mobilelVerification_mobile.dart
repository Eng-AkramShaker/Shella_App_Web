import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_custom_app_bar.dart';
import 'package:shella_design/features/Auth/widgets/mobile/custom_pin_code_txt_field_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/resend_code_row_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/send_verify_btn_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/timer_row_mobile.dart';
import 'package:shella_design/common/util/app_styles.dart';

class MobilelVerification extends StatefulWidget {
  const MobilelVerification({super.key});

  @override
  State<MobilelVerification> createState() => _MobilelVerificationState();
}

class _MobilelVerificationState extends State<MobilelVerification> {
  @override
  Widget build(BuildContext context) {
    TextEditingController code = TextEditingController();
    Size size = MediaQuery.of(context).size;

    int endTime =
        DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 9; // 9 minutes
    void onEnd() {
      // ignore: avoid_print
      print("Countdown Finished!");
    }

    CountdownTimerController controller =
        CountdownTimerController(endTime: endTime, onEnd: onEnd);

    return Scaffold(
      appBar: buildCustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MainAppConstants.checkMobileNumber,
                  style: font18Black600W(context),
                ),
                SizedBox(
                  width: size.width,
                  height: 10,
                ),
                Consumer<AuthController>(
                  builder: (context, authController, _) {
                    return Text(
                      MainAppConstants.otp + authController.phone!,
                      style: font14Black400W(context),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Text(
              MainAppConstants.inputOtp,
              style: font14Black400W(context),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Consumer<AuthController>(
              builder: (context, authController, _) {
                return CustomPinCodeTextField(
                  code: code,
                  size: size,
                  onChanged: (value) =>
                      authController.updateVerificationCode(value),
                );
              },
            ),
            SizedBox(
              height: size.height / 30,
            ),
            ResendCodeRow(),
            TimerRow(controller: controller, endTime: endTime),
            SizedBox(
              height: size.height / 20,
            ),
            SendVerificationCodeButton(
              code: code,
            ),
          ],
        ),
      ),
    );
  }
}
