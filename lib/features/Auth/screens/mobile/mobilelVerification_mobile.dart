import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
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

    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 9; // 9 minutes
    void onEnd() {
      // ignore: avoid_print
      print("Countdown Finished!");
    }

    CountdownTimerController controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "التحقق رقم هاتفك الخاص",
                  style: font18Black600W(context),
                ),
                SizedBox(
                  width: size.width,
                  height: 10,
                ),
                Text(
                  'تم ارسال رمز التحقق الى الرقم الخاص بك 96632221155+',
                  style: font14Black400W(context),
                ),
              ],
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Text(
              'ادخل رمز التحقق',
              style: font14Black400W(context),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            CustomPinCodeTextField(code: code, size: size),
            SizedBox(
              height: size.height / 30,
            ),
            ResendCodeRow(),
            TimerRow(controller: controller, endTime: endTime),
            SizedBox(
              height: size.height / 20,
            ),
            SendVerificationCodeButton(),
          ],
        ),
      ),
    );
  }
}
