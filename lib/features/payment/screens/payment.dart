import 'package:flutter/material.dart';
import 'package:shella_design/features/payment/screens/MobilePayment.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';

class Payment_Screen extends StatelessWidget {
  const Payment_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: MobilePayment(),
    );
  }
}
