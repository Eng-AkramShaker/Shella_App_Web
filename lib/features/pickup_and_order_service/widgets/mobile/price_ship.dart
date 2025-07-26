import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class PriceShip extends StatelessWidget {
  double? price;
   PriceShip({this.price});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.wtColor,
          borderRadius: BorderRadius.circular(10.r),
           border: Border.all(
            color: Colors.grey
               ),
        ),
        height: 38.h,
        width: 80.w,
        child:  Center(
        child: Custom_Text(
          context,
          text: price!= null ? '${price!.toInt().toString()} SAR' : '30 SAR' ,
          style: font14Black400W(context)
          )
          ),
      
      ),
    );
  }
}