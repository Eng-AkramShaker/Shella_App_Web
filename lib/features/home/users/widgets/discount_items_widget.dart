import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/helper/grid_view_fix_height.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/lists.dart';
import 'package:shella_design/features/home/users/widgets/discount_item.dart';
import 'package:shella_design/features/my_points/widgets/mobile/offers_gride.dart';

class DiscountItemsWidget extends StatelessWidget {
  const DiscountItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Padding(
        padding: ResponsiveLayout.isWeb() ? EdgeInsets.all(32.0.w) : EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: ResponsiveLayout.isWeb() && !ResponsiveLayout.isMobile(context) && !ResponsiveLayout.isTab(context)
                  ? 4
                  : 3, // Number of columns in the grid
              crossAxisSpacing: ResponsiveLayout.isWeb() ? 50.h : 15.0.h, // Spacing between columns
              mainAxisSpacing: ResponsiveLayout.isWeb() ? 50.h : 10.0.w, // Spacing between rows
              height: ResponsiveLayout.isWeb() ? 255.h : 160.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: discounts.length, // Total number of products
          itemBuilder: (context, index) {
            return DiscountItem(
              id: discounts[index]['id'],
              name: discounts[index]['name'],
              image: discounts[index]['image'],
              price: discounts[index]['price'],
               discount: discounts[index]['discount'], 
      
      
            );
          },
        ),
      ),
    );
  }
}