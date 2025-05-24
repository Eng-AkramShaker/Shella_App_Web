import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';

Widget buildSearchItem(BuildContext context, String text,int index) => Column(
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.search, size: 20,color: AppColors.bgColor,),
              const SizedBox(width: 10),
              Custom_Text(
                context,
                text: text,
                color: AppColors.bgColor,
                style: font10Black300W(context, size: size_11(context)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Provider.of<SearchFilterController>(context,listen: false).removeSearchHistoryItem(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.bgColor),
                shape: BoxShape.circle
              ),
              child: Icon(Icons.close,size: 18,),
            ),
          )
        ],
      ),
    ),
    const Divider(height: 1,color: AppColors.gryColor_5,),
  ],
);
