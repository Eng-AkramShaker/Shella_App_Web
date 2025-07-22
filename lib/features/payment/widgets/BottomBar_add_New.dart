import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';

class BottomBar_Add_NewScren extends StatelessWidget {
  const BottomBar_Add_NewScren({super.key});

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
            title: 'إضافة',
            h: 45.h,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
