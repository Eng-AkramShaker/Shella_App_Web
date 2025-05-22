import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
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
          CategoryInfoWeb(categoryImg: AppImages.food, categoryName: 'مطاعم', categoryCount: '300',isSelected: true,),
          CategoryInfoWeb(categoryImg: AppImages.pharmacy, categoryName: 'صيدليات', categoryCount: '75',),
          CategoryInfoWeb(categoryImg: AppImages.market, categoryName: 'متاجر', categoryCount: '60'),
          CategoryInfoWeb(categoryImg: AppImages.carrot, categoryName: 'خضار وفواكه', categoryCount: '80'),
          CategoryInfoWeb(categoryImg: AppImages.fish, categoryName: 'لحوم واسماك', categoryCount: '25'),
        ],
      ),
    );
  }
}