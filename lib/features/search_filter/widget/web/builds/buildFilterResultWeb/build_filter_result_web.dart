import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

import '../../../../controller/search_filter_controller.dart';
import 'filterCategoryWeb/filter_category_web.dart';
import 'filterLocationWeb/filter_location_web.dart';
import 'filterRatingWeb/filter_rating_web.dart';
import 'priceRangeWeb/price_range_web.dart';

class BuildFilterResultWeb extends StatelessWidget {
  const BuildFilterResultWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gryColor_3),
        borderRadius: BorderRadius.circular(5)
      ),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: SizedBox(
        width: width(context, 0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Custom_Text(context, text: 'تصفية النتائج',style: font11Black500W(context,size: 14)),
            PriceRangeWeb(),
            if(SearchFilterController.get(context).allCategoriesModel!=null)
            FilterCategoryWeb(),
            FilterRatingWeb(),
            FilterLocationWeb()
          ],
        ),
      ),
    );
  }
}