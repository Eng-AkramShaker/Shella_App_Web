import 'package:flutter/material.dart';
import 'package:shella_design/features/search_filter/widget/web/builds/buildFilterResultWeb/filterCategoryWeb/categoryInfoWeb/category_info_web.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';

class FilterCategoryWeb extends StatelessWidget {
  const FilterCategoryWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Custom_Text(context, text: 'التصنيفات',style: font11Black400W(context,size: 12)),
        // CategoryInfoWeb(categoryImg: categoryImg, categoryName: categoryName, categoryCount: categoryCount)
      ],
    );
  }
}