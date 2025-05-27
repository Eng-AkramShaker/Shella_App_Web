import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/search_filter/widget/web/builds/buildFilterResultWeb/filterCategoryWeb/categoryInfoWeb/category_info_web.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';

class FilterCategoryWeb extends StatelessWidget {
  const FilterCategoryWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context, 0.25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 10,),
          Custom_Text(context, text: 'التصنيفات',style: font11Black400W(context,size: 13)),
          SizedBox(height: 5,),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => CategoryInfoWeb(categoryImg: SearchFilterController.get(context).allCategoriesModel![index].image??'', categoryName: SearchFilterController.get(context).allCategoriesModel![index].name??'', categoryCount: SearchFilterController.get(context).allCategoriesModel![index].productsCount.toString(),isSelected: index==0,),
            separatorBuilder: (context, index) => SizedBox(height: 10,),
            itemCount: SearchFilterController.get(context).allCategoriesModel!.length
          )
        ],
      ),
    );
  }
}