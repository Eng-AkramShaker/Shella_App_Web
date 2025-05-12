import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/appBar.dart';
import 'package:shella_design/features/statistics/widgets/most_purchased_products.dart';
import 'package:shella_design/features/statistics/widgets/statistics_kaidha_and_container_details.dart';
import 'package:shella_design/common/util/app_colors.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: custom_AppBar(context, 'إحصائياتي', Icons.arrow_back_sharp, Icons.shopping_bag_outlined),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatisticsKaidhaAndContainerDetails(),
              SizedBox(height: 16.h),
              MostPurchasedProducts(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
