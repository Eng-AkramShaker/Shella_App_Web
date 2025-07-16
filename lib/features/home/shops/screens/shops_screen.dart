// ignore_for_file: unused_element, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/addressRow/buildAddressRow.dart';
import 'package:shella_design/common/widgets/resturantGride/build_resturant_gride.dart';
import 'package:shella_design/common/widgets/searchRow/buildSearchRow.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_category_list_view.dart';
import 'package:shella_design/features/home/hyper/widgets/builds/build_section_title.dart';

class ShopsScreen extends StatefulWidget {
  const ShopsScreen({super.key});

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  int selectedIndex = 2;

  double containerHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        containerHeight = _getContainerHeight();
      });
    });
  }

  double _getContainerHeight() {
    return 119.0.h;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(containerHeight),
        child: Container(
          color: AppColors.primaryColor,
          padding: EdgeInsets.only(bottom: 6.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: buildSearchRow(context),
              ),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.w),
                child: buildAddressRow(context),
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildSectionTitle(context, title: "الاقسام", lapel: 'عرض الكل', underline: false),
              SizedBox(height: 16.h),
              BuildCategoryListView(),
              SizedBox(height: 16.h),
              buildRestaurantGrid(context),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
