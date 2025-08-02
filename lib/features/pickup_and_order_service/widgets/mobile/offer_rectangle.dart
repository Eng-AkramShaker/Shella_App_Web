import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
    
class OfferRectangle extends StatelessWidget {

  double decreasePrice;
  double increasePrice;
  double OfferPrice;

OfferRectangle({required this.OfferPrice,required this.decreasePrice,required this.increasePrice});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.grey.shade200
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Container(
                width:40.w,
                height:40.h,
                decoration:BoxDecoration(
                  color: AppColors.gryColor_12,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Center(
                  child: Custom_Text(context,text: '${decreasePrice.toInt().toString()} -',style: font16Black500W(context)),
                ),
              ),
              
              Custom_Text(context,text: 'SAR ${OfferPrice.toInt().toString()}',style: font24Primary700W(context)),
        
              Container(
                width:40.w,
                height:40.h,
                decoration:BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Center(
                  child: Custom_Text(context,text: '${decreasePrice.toInt().toString()} +',style: font16White500W(context)),
                ),
              ),
        
          ],
        ),
      ),
    );
  }
}