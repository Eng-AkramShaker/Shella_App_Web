// ignore_for_file: file_names, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/features/orders/widgets/builds/history/history_orders_component.dart';
import 'package:shella_design/features/orders/widgets/builds/running/running_orders_component.dart';
import 'package:shella_design/features/orders/widgets/builds/schedule/schedule_orders_component.dart';
import 'package:shella_design/features/orders/widgets/taps_card.dart';
import 'package:shella_design/common/util/app_colors.dart';

class MobileOrders_Screen extends StatefulWidget {
  const MobileOrders_Screen({super.key});

  @override
  State<MobileOrders_Screen> createState() => _MobileOrders_ScreenState();
}

class _MobileOrders_ScreenState extends State<MobileOrders_Screen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: customAppBar(context, title: 'طلباتي'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),

            TapsCard(tabController: _tabController),

            // --------------------  TabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  runningOrdersComponent(context),
                  scheduleOrdersComponent(context),
                  historyOrdersComponent(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
