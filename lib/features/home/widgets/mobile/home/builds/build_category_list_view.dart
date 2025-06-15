import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/product/widgets/mobile/category/category_item.dart';
import 'package:shella_design/common/util/app_colors.dart';

class BuildCategoryListView extends StatelessWidget {
  const BuildCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(HomeController.get(context).homeCategoriesModel!.length, (index) {
            return Padding(
              padding: EdgeInsets.only(right: 10.w, left: 3.w),
              child: GestureDetector(
                onTap: () {
                  HomeController.get(context,listen: false).selectCategory(index);
                  customPrint('storesCount');
                  customPrint(HomeController.get(context,listen: false).homeCategoriesModel![index].storesCount);
                  HomeController.get(context,listen: false).getPopularStores(type: HomeController.get(context,listen: false).homeCategoriesModel![index].moduleType,moduleId: HomeController.get(context,listen: false).homeCategoriesModel![index].id.toString());
                  HomeController.get(context,listen: false).getStores();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 13, left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryItem(image: HomeController.get(context).homeCategoriesModel![index].iconFullUrl??'', label: HomeController.get(context).homeCategoriesModel![index].moduleName??''),
                      if(HomeController.get(context).categoryIndex==index)
                      SizedBox(width: width(context, 0.2),child: Divider(color: AppColors.greenColor,thickness: 2.5,))
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}