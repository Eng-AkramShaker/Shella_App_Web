import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/addressRow/buildAddressRow.dart';
import 'package:shella_design/common/widgets/resturantGride/build_resturant_gride.dart';
import 'package:shella_design/common/widgets/searchRow/buildSearchRow.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import '../../../widgets/mobile/home/builds/buildSectionTitle_One.dart';
import '../../../widgets/mobile/home/builds/build_banner.dart';
import '../../../widgets/mobile/home/builds/build_banners_loading.dart';
import '../../../widgets/mobile/home/builds/build_category_list_view.dart';
import '../../../widgets/mobile/home/builds/build_category_loading.dart';
import '../../../widgets/mobile/home/builds/build_stores.dart';
import '../../../widgets/mobile/home/builds/build_stores_loading.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  var pageController = PageController();

  @override
  void initState() {
    HomeController.get(context,listen: false).getHomeCategories();
    HomeController.get(context,listen: false).getHomeBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.h),
        child: Container(
          color: AppColors.primaryColor,
          padding: EdgeInsets.only(bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: buildSearchRow(context),
              ),
              SizedBox(height: 10),
              buildAddressRow(context),
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
              // Consumer<SplashController>(builder: (context, controller, _) {
              //   return Card(
              //     color: Colors.red,
              //     child: ElevatedButton(
              //       child: const Text('data'),
              //       onPressed: () async {
              //         //
              //
              //         await controller.getConfigData(context);
              //       },
              //     ),
              //   );
              // }),
              //
              // //
              buildSectionTitle_One(context, title: "الاقسام", lapel: 'عرض الكل', underline: false),
              SizedBox(height: 16.h),
              HomeController.get(context).categoryState==HomeState.loading||HomeController.get(context).homeCategoriesModel==null?
              BuildCategoryLoading():
              BuildCategoryListView(),
              SizedBox(height: 22.h),
              HomeController.get(context).bannerState==HomeState.loading||HomeController.get(context).homeBannersModel==null?
              BuildBannersLoading():
              buildBanner(context,controller: pageController),
              if(HomeController.get(context).popularStoresModel!=null&&HomeController.get(context).isFood())
              buildRestaurantGrid(context),
              SizedBox(height: 24.h),
              HomeController.get(context).storesState==HomeState.loading||HomeController.get(context).storesModel==null?
              BuildStoresLoading():
              BuildStores(),
              // buildDeliveryListView(context),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
