

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

PreferredSize ChatAppBar(BuildContext context){

  return PreferredSize(
    preferredSize:  Size.fromHeight(113),
    child: AppBar(
      backgroundColor:AppColors.greenColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        children: [
          Positioned(
            bottom: 40.h,
            right: 115.w,

            child: Custom_Text(context,text:"أحمد محمد",style: font14White500W(context))
            ),
              Positioned(
            bottom: 15.h,
            right: 115.w,

            child: Custom_Text(context,text:MainAppConstants.isActive,style: font12White500W(context))
            ),
              Positioned(
            bottom: 10.h,
            right: 15.w,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp,
                  color: AppColors.wtColor, size: 26),
              onPressed: (){
                nav.back();
              },
            ),
            
          ),
          Positioned(
            bottom: 10.h,
            right: 60.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(48),
             child: Image.network(
             "https://mediaassets.cbre.com/cdn/-/media/project/cbre/shared-site/menat/saudi-arabia/articles/saudi-arabia-market-review-q2-2024/ksaq22024_report_image.png?iar=0&rev=e2547eb45e9b46eab325aac9f13e5303&key=articlehero-wideimage&device=desktop",
               width: 45,
               height: 45,
               fit: BoxFit.cover,
               errorBuilder: (_, __, ___) => const Icon(Icons.person),
                ),
               ),
          )
            
            ]
    )));
}