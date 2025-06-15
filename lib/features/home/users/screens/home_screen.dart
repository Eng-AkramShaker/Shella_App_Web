import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/addressRow/buildAddressRow.dart';
import 'package:shella_design/common/widgets/resturantGride/build_resturant_gride.dart';
import 'package:shella_design/common/widgets/searchRow/buildSearchRow.dart';
<<<<<<< HEAD:lib/features/home/home/home_screen.dart
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/home/home/widgets/builds/buildSectionTitle_One.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_banner.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_category_list_view.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_delivery_list_view.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_section_title_2.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_section_title_two.dart';
=======
import 'package:shella_design/common/util/app_colors.dart';
import '../../widgets/mobile/home/builds/buildSectionTitle_One.dart';
import '../../widgets/mobile/home/builds/build_banner.dart';
import '../../widgets/mobile/home/builds/build_category_list_view.dart';
import '../../widgets/mobile/home/builds/build_delivery_list_view.dart';
import '../../widgets/mobile/home/builds/build_section_title_2.dart';
import '../../widgets/mobile/home/builds/build_section_title_two.dart';
>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2:lib/features/home/users/screens/home_screen.dart

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(117.0.h),
        child: Container(
          color: AppColors.primaryColor,
          padding: EdgeInsets.only(bottom: 6.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: buildSearchRow(context)),
              SizedBox(height: 14.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11.w),
                  child: buildAddressRow(context)),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<HomeController>(builder: (context, pro_home, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildSectionTitle_One(context,
                    title: "الاقسام", lapel: 'عرض الكل', underline: false),
                SizedBox(height: 16.h),
                BuildCategoryListView(),
                SizedBox(height: 22.h),
                buildBanner(context),
                SizedBox(height: 16.h),
                buildSectionTitle_2("اشهر المطاعم", context),
                SizedBox(height: 16.h),
                buildRestaurantGrid(context),
                SizedBox(height: 24.h),
                buildSectionTitleTow(context,
                    title: "المطاعم القريبة منك",
                    lapel: "المزيد",
                    underline: true),
                SizedBox(height: 16.h),
                buildDeliveryListView(context),
                SizedBox(height: 50.h),
              ],
            ),
          );
        }),
      ),
    );
  }
}
