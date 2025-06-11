import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/home/widgets/mobile/home/restaurant_Item.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';

import '../../../features/home/widgets/mobile/home/builds/build_section_title_2.dart';

Widget buildRestaurantGrid(context) {
 return Column(
   children: [
     SizedBox(height: 16.h),
     buildSectionTitle_2("اشهر المطاعم", context),
     SizedBox(height: 10),
     Container(
        width: width_media(context),
        margin: EdgeInsets.zero,
        child: Center(
          child: Wrap(
            spacing: 0,
            runSpacing: 0,
            children: List.generate(HomeController.get(context).popularStoresModel!.stores!.length, (index) {
              return Padding(
                padding: EdgeInsets.all(8.0.w),
                child: SizedBox(
                  child: RestaurantItem(image: HomeController.get(context).popularStoresModel!.stores![index].logoFullUrl??''),
                ),
              );
            }),
          ),
        ),
      ),
   ],
 );
}