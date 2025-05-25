import 'package:flutter/material.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'mobile/mobile_widget.dart';

class MyCouponScreen extends StatefulWidget {
  const MyCouponScreen({super.key});

  @override
  State<MyCouponScreen> createState() => _MyCouponScreenState();
}

class _MyCouponScreenState extends State<MyCouponScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileBody: MyCouponMobileWidget());
  }
}
