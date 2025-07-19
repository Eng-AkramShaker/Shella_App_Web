import 'package:flutter/material.dart';
import 'package:shella_design/features/my_points/screens/mobile/my_points_mobile_widget.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';

class MyPointsScreenMobile extends StatelessWidget {
  const MyPointsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileBody: MyPointsMobileWidget());
  }
}
