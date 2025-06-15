import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';

class SearchResultContainerWeb extends StatelessWidget {
  const SearchResultContainerWeb({super.key, required this.itemImg, required this.itemName, required this.rate, required this.index});

  final String itemImg;
  final String itemName;
  final String rate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => SearchFilterController.get(context,listen: false).checkHover(true,index),
      onExit: (event) => SearchFilterController.get(context,listen: false).checkHover(false,index),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: SearchFilterController.get(context).isHover==true&&SearchFilterController.get(context).containerIndex==index?AppColors.greenColor:AppColors.gryColor_3),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.wtColor,
          boxShadow: SearchFilterController.get(context).isHover==true&&SearchFilterController.get(context).containerIndex==index?[
            BoxShadow(color: AppColors.gryColor_4,blurRadius: 5,spreadRadius: 3,)
          ]:null
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
            SizedBox(height: height(context, 0.17),width: width(context, 0.3),child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(itemImg,errorBuilder: (context, error, stackTrace) => SizedBox(),))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custom_Text(context, text: itemName,style: font14Black600W(context,size: 13),maxLines: 3),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Custom_Text(context, text: 'التقييمات ',size: 10,color: AppColors.secondaryColor),
                      Icon(Icons.star_border_purple500_outlined,color: AppColors.secondaryColor,size: 15,),
                      SizedBox(width: 5,),
                      Custom_Text(context, text: rate),
                    ],
                  ),
                  SizedBox(height: 15,),
                  IntrinsicWidth(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.greenColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                        child: Custom_Text(context, text: 'عرض المنتج',color: AppColors.wtColor,size: 12),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}