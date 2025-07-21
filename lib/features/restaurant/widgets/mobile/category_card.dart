import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class CategoryCard extends StatelessWidget {
   String? name;
   String? image;
    CategoryCard({super.key, this.name,this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
          Container(
            decoration: BoxDecoration(
                    color:AppColors.wtColor,
                   borderRadius: BorderRadius.circular(12.0),
                   border: Border.all(
                    color: AppColors.secondaryColor
                   )
            ),
            height: 110.h,
            width: 110.w,
            child: custom_Images_asset(image: image!,h: 100.h,w: 100.w),
            
            
            ),
        
        SizedBox(height: 6.h,),

         Custom_Text(context, text: name!,size: 12)
      ],
    );
  }
}