import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';

class SearchResultContainerWeb extends StatelessWidget {
  const SearchResultContainerWeb({super.key, required this.itemImg, required this.itemName, required this.rate});

  final String itemImg;
  final String itemName;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gryColor_3),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          SizedBox(height: height(context, 0.17),width: width(context, 0.3),child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(itemImg,errorBuilder: (context, error, stackTrace) => SizedBox(),))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Custom_Text(context, text: 'عرض المتجر',color: AppColors.wtColor,size: 12),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}