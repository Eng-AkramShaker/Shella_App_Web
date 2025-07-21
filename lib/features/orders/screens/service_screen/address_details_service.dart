// ignore_for_file: file_names, avoid_unnecessary_containers, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/widgets/bottom_bar.dart';
import 'package:shella_design/features/orders/widgets/builds/build_info_section.dart';
import 'package:shella_design/features/orders/widgets/builds/build_tab_bar.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class Address_Details_Service_Screen extends StatefulWidget {
  const Address_Details_Service_Screen({super.key});

  @override
  State<Address_Details_Service_Screen> createState() =>
      _Address_Details_Service_ScreenState();
}

class _Address_Details_Service_ScreenState
    extends State<Address_Details_Service_Screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController notesController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(
        context,
        title: 'موقع الطرود',
        img: AppImages.icon_order_service,
        onPressed: () => nav.back(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            buildTabBar(_tabController, context),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildInfoSection(context, notesController, phoneController),
                  Center(
                    child: Custom_Text(context,
                        text: "لا توجد طلبات مجدولة",
                        style: font14Black400W(context)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
