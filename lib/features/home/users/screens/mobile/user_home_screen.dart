// ignore_for_file: unused_element, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
<<<<<<< HEAD:lib/features/home/users/screens/user_home_screen.dart
import 'package:shella_design/common/widgets/addressRow/buildAddressRow.dart';
import 'package:shella_design/common/widgets/searchRow/buildSearchRow.dart';
=======
>>>>>>> ca00feb5d5f66482735258a1e82bb62c0eb10a58:lib/features/home/users/screens/mobile/user_home_screen.dart
import 'package:shella_design/features/home/home/widgets/builds/buildSectionTitle_One.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_banner.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_category_list_view.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_delivery_list_view.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_most_popular.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_section_title_two.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_visit_again.dart';
import 'package:shella_design/features/home/home/widgets/builds/categories_select_list.dart';
<<<<<<< HEAD:lib/features/home/users/screens/user_home_screen.dart
=======
import 'package:shella_design/features/home/users/widgets/mobile/green_button_widget.dart';
import 'package:shella_design/features/home/users/widgets/mobile/home_screen_app_bar_widget.dart';
>>>>>>> ca00feb5d5f66482735258a1e82bb62c0eb10a58:lib/features/home/users/screens/mobile/user_home_screen.dart

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
<<<<<<< HEAD:lib/features/home/users/screens/user_home_screen.dart
                    buildSectionTitleTow(
                      context,
                      icon: true,
                      iconUrl: AppImages.fireIcon,
                      title: 'المنتجات الأكثر شعبية',
                      underline: false,
                    ),
                    Container(
                      height: 35,
                      width: 60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.greenColor),
                      child: Center(
                          child: Text(
                        'رؤية الكل',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )),
                    ),
=======
                    buildSectionTitleTow(context,
                        icon: true,
                        iconUrl: AppImages.fireIcon,
                        title: MainAppConstants.mostPopularProducts,
                        underline: false),
                    greenButtonWidget(text: MainAppConstants.seeAll),
>>>>>>> ca00feb5d5f66482735258a1e82bb62c0eb10a58:lib/features/home/users/screens/mobile/user_home_screen.dart
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
