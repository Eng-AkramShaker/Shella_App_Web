import 'package:flutter/material.dart';
import 'package:shella_design/features/Auth/widgets/web/otp_body_web.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: BodyOtp(),
        ),
      ),
    );
  }
}
