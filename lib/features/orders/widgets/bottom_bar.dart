// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          custom_Button(
            context,
            title: 'يكمل',
            h: 45.h,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
