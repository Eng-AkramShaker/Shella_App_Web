// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/helper/app_routes.dart';

class BottomBar_CartScren extends StatelessWidget {
  const BottomBar_CartScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      margin: EdgeInsets.symmetric(vertical: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          custom_Button(
            context,
            title: 'الدفع',
            h: 45.h,
            onPressed: () {
              nav.push(AppRoutes.payment_screen);
            },
          ),
        ],
      ),
    );
  }
}
