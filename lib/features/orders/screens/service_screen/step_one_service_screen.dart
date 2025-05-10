// ignore_for_file: file_names, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_category_list_view.dart';
import 'package:shella_design/features/orders/widgets/step_service/build_delivery.dart';
import 'package:shella_design/features/orders/widgets/step_service/build_image_title.dart';
import 'package:shella_design/features/orders/widgets/step_service/build_service.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_navigators.dart';

class Step_One_Service_Screen extends StatefulWidget {
  const Step_One_Service_Screen({super.key});

  @override
  State<Step_One_Service_Screen> createState() => _Step_One_Service_ScreenState();
}

class _Step_One_Service_ScreenState extends State<Step_One_Service_Screen> {
  int selectedIndex = 3;
  List<int> img = [7, 2, 1, 8];
  List<String> title = ["خدمة تخدمني", "المطاعم", "سوبر ماركت", "استلام وتسليم"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: customAppBar(
        context,
        img: AppImages.icon_order_service,
        title: 'خدمة استلام وتسليم',
        onPressed: () {
          //
          popRoute(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              BuildCategoryListView(),
              SizedBox(height: 22.h),
              buildImageTitle(context),
              SizedBox(height: 22.h),
              buildDelivery(context),
              SizedBox(height: 40.h),
              buildService(context),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

  // Category ListView


  // Delivery

  //  Service

}
