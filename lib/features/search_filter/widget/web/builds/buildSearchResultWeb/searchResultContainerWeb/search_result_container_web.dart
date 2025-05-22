import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/button/custom_button.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';

class SearchResultContainerWeb extends StatelessWidget {
  const SearchResultContainerWeb({super.key, required this.itemImg, required this.itemName, required this.rate, required this.location, required this.deliveryTime, required this.storeOffer});

  final String itemImg;
  final String itemName;
  final String rate;
  final String location;
  final String deliveryTime;
  final String storeOffer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gryColor_3),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          SizedBox(height: height(context, 0.17),width: width(context, 0.3),child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(itemImg,fit: BoxFit.fill,))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Custom_Text(context, text: itemName,style: font14Black600W(context,size: 13)),
                    Spacer(),
                    Custom_Text(context, text: 'التقييمات ',size: 10,color: AppColors.secondaryColor),
                    Icon(Icons.star_border_purple500_outlined,color: AppColors.secondaryColor,size: 15,),
                    SizedBox(width: 5,),
                    Custom_Text(context, text: rate),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Custom_Text(context, text: location,size: 11),
                    SizedBox(width: 5,),
                    Icon(Icons.location_on_outlined,size: 15,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Custom_Text(context, text: deliveryTime,size: 11),
                    SizedBox(width: 5,),
                    Icon(Icons.access_time_outlined,size: 15,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(height: 25,width: width(context, 0.08),text: 'عرض المتجر',color: AppColors.greenColor,textSize: 12,colorTxt: AppColors.wtColor,circular: 5,),
                    Custom_Text(context, text: storeOffer,style: font12LightGreen600W(context)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}