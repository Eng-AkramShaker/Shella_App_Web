import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_navigators.dart';

class BottomBar_PymentScren extends StatelessWidget {
  const BottomBar_PymentScren({super.key});

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
            title: 'إتمام الطلب',
            h: 45.h,
            onPressed: () {
              pushNewScreen(context, AppRoutes.payment_method_screen);
            },
          ),
        ],
      ),
    );
  }
}
