import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class DiscountItem extends StatelessWidget {
  int? id;
  String name;
  String image;
  double? price;
  double? discount;
   DiscountItem({
    required this.id,
  required this.name,
  required this.price,
  required this.discount,
  required this.image}
  );

  @override
  Widget build(BuildContext context) {
    return  Align(
      child: Container(
        decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                    border: Border.all(
                      color:Colors.grey.shade300,
                      width: 1.5
                    ),
                    borderRadius: BorderRadius.circular(12.0)
                  ),
        height: 146.h,
        width: 100.w,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  
                  
                  child: custom_Images_asset(image: image, h: 100.h, w: 100.w)
                  ),
                Positioned(
                  left: 75.w,
                  top:70.h,
                  child: Image.asset(AppImages.addIcon,width: 24,height: 24,)
                  )
           ] ),
            SizedBox(height: 0),
            Custom_Text(context, text: name, color: Colors.black),
             SizedBox(height: 6),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Custom_Text(context,
                   text: discount.toString(), 
                  color: Colors.black,
                   style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 1.0
                        )
                        ),

           Custom_Text(context,
            text: "${price.toString()} ريال",
             color: AppColors.secondaryColor,
             ),


              ],
              )

          ],
        ),
      ),
    );
  }
}