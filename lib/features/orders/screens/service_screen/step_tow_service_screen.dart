// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/features/orders/widgets/step_service/build_delivery_step_two.dart';
import 'package:shella_design/features/orders/widgets/step_service/build_image_step_two.dart';
import 'package:shella_design/features/orders/widgets/step_service/build_service.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';

class Step_Tow_Service_Screen extends StatefulWidget {
  const Step_Tow_Service_Screen({super.key});

  @override
  State<Step_Tow_Service_Screen> createState() => _Step_Tow_Service_ScreenState();
}

class _Step_Tow_Service_ScreenState extends State<Step_Tow_Service_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: customAppBar(
        context,
        img: AppImages.deliv_1,
        title: "نقل بواسطة الدراجة",
        onPressed: () {
          //

          nav.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              buildImageTitleStepTwo(context),
              SizedBox(height: 24.h),
              buildDeliveryStepTwo(context),
              SizedBox(height: 30.h),
              buildService(context),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

  // images and Title

  // Delivery
}
