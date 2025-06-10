import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/product/widgets/category/category_item.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/lists.dart';

class BuildCategoryListView extends StatefulWidget {
  const BuildCategoryListView({super.key});

  @override
  State<BuildCategoryListView> createState() => _BuildCategoryListViewState();
}

class _BuildCategoryListViewState extends State<BuildCategoryListView> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: List.generate(HomeController.get(context).homeCategoriesModel!.length, (index) {
            return Padding(
              padding: EdgeInsets.only(right: 10.w, left: 3.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 13, left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryItem(image: HomeController.get(context).homeCategoriesModel![index].iconFullUrl??'', label: HomeController.get(context).homeCategoriesModel![index].moduleName??''),
                      if(selectedIndex==index)
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