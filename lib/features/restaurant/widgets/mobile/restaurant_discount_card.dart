import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class RestaurantDiscountCard extends StatelessWidget {

  final String? topIcon;
  final String? bottomIcon;
  final String? doneString;
  final String? description;
  final String? urlAction;
  final bool isUsed;


   RestaurantDiscountCard({ required this.isUsed,this.topIcon,this.bottomIcon,this.description,this.urlAction,this.doneString});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
              color:AppColors.wtColor,
             borderRadius: BorderRadius.circular(12.0),
             border: Border.all(
              color: AppColors.secondaryColor
             )
      ),
      height: 110.h,
      width: 110.w,
      child:Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: topIcon != null ? SvgPicture.asset(topIcon!,) : SizedBox()
            ),

            Positioned(
              right: 0,
              top:30,
              child: Container(
                  width: 110,
                  child: Custom_Text(context, text: description??" ",
                  maxLines: 2,
                  textOverFlow: TextOverflow.ellipsis,
                  ),
                
              )),

              isUsed ? Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  children: [
                      bottomIcon != null ? SvgPicture.asset(bottomIcon!) : SizedBox(),
                      SizedBox(width: 5,),
                      Custom_Text(context, text: doneString??" ")
                  ],
                
                )
                )
              
              : Positioned(
                right: 10,
                bottom: 10,
                
                child: InkWell(
                  child: Custom_Text(context, text: urlAction ??"",underline: true),
                  onTap: () {},
                  )
                  )
        ],

      )
      
    );
  }
}