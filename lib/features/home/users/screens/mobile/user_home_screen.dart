// ignore_for_file: unused_element, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/features/home/home/widgets/builds/buildSectionTitle_One.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_banner.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_category_list_view.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_delivery_list_view.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_most_popular.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_section_title_two.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_visit_again.dart';
import 'package:shella_design/features/home/home/widgets/builds/categories_select_list.dart';
import 'package:shella_design/features/home/users/widgets/mobile/green_button_widget.dart';
import 'package:shella_design/features/home/users/widgets/mobile/home_screen_app_bar_widget.dart';

class Users_Home_Screen extends StatefulWidget {
  const Users_Home_Screen({super.key});

  @override
  State<Users_Home_Screen> createState() => _Users_Home_ScreenState();
}

class _Users_Home_ScreenState extends State<Users_Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: homeScreenAppBar(context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSectionTitle_One(
                  context,
                  title: MainAppConstants.sections,
                  underline: false,
                ),
                SizedBox(height: 16.h),
                BuildCategoryListView(),
                buildBanner(context),
                SizedBox(height: 16.h),
                buildVisitAgain(context),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildSectionTitleTow(context,
                        icon: true,
                        iconUrl: AppImages.fireIcon,
                        title: MainAppConstants.mostPopularProducts,
                        underline: false),
                    greenButtonWidget(text: MainAppConstants.seeAll),
                  ],
                ),
                SizedBox(height: 20.h),
                BuildMostPopular(),
                SizedBox(height: 20.h),
                SizedBox(height: 16.h),
                buildSectionTitleTow(
                  context,
                  title: MainAppConstants.allStores,
                  lapel: MainAppConstants.nearByStores,
                  underline: false,
                ),
                CategoriesSelectList(),
                SizedBox(height: 16.h),
                buildDeliveryListView(context),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
