import 'package:flutter/material.dart';
import 'package:shella_design/features/my_points/screens/my_points_mobile_widget.dart';
import 'package:shella_design/helper/responsive_helper.dart';

class MyPointsScreen extends StatelessWidget {
  const MyPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileBody: MyPointsMobileWidget());
  }
}
