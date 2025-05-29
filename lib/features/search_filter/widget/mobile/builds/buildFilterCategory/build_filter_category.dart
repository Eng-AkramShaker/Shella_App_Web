import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import '../../../../../../common/util/app_styles.dart';

class BuildFilterCategory extends StatelessWidget {
  const BuildFilterCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context, 0.12),
      width: width(context, 1),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 5,bottom: 0),
        itemBuilder: (context, index) => Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.gryColor_3,
              backgroundImage: NetworkImage(SearchFilterController.get(context).allCategoriesModel![index].image??'',),
            ),
            SizedBox(height: 5,),
            Custom_Text(context, text: SearchFilterController.get(context).allCategoriesModel![index].name??'',  style: font11Black500W(context)),
            SizedBox(height: 5,),
            Custom_Text(context, text: '(${SearchFilterController.get(context).allCategoriesModel![index].productsCount})'),
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 13,),
        itemCount: SearchFilterController.get(context).allCategoriesModel!.length,
      ),
    );
  }
}