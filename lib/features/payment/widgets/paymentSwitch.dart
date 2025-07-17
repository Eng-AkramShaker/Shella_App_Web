import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shella_design/common/widgets/container/empty_%20container.dart';
import 'package:shella_design/common/widgets/divider/custom_divider.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class paymentSwitch extends StatefulWidget {
  const paymentSwitch({super.key});

  @override
  State<paymentSwitch> createState() => _paymentSwitchState();
}

class _paymentSwitchState extends State<paymentSwitch> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container_Empty(
          h: 70.h,
          w: width_media(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  custom_Images_asset(
                    image: AppImages.icon_cach_2,
                    h: 26.h,
                    w: 28.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Custom_Text(
                        context,
                        text: "استخدم رصيد المحفظة",
                        style: font11Grey400W(context),
                      ),
                      Custom_Text(
                        context,
                        text: " 100 ر.س",
                        style: font10Black600W(context),
                      ),
                    ],
                  ),
                ],
              ),
              FlutterSwitch(
                width: 60.0,
                height: 30.0,
                toggleSize: 25.0,
                value: status,
                borderRadius: 20.0,
                activeColor: AppColors.gryColor_6,
                inactiveColor: AppColors.gryColor_5,
                toggleColor: AppColors.greenColor,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 1.h),
        Custom_Divider(),
        SizedBox(height: 10.h),
      ],
    );
  }
}
