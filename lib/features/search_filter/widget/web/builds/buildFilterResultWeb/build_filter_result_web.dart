import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

import 'filterCategoryWeb/filter_category_web.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Custom_Text(context, text: 'تصفية النتائج',style: font11Black500W(context,size: 14)),
          PriceRangeWeb(),
          FilterCategoryWeb()
        ],
      ),
    );
  }
}