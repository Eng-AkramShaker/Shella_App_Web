

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

PreferredSize orderAppBar(BuildContext context,
    {TextStyle? style,
    String? title,
    String? orderStatus,
    String? img,
    int? orderNumber,
    IconData? icon,
    Color? iconbackcolor,
    Color? backgroundColor,
    double? appBarHeight,
    Function()? onPressed}) {
  return PreferredSize(
    preferredSize:  Size.fromHeight(appBarHeight ?? 190),
    child: AppBar(
      backgroundColor: backgroundColor ?? AppColors.greenColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        children: [
          Positioned(
            top: 70.h,
            left: 150.w,

            child: Custom_Text(context,text: title ?? "Title",style: font16White500W(context))
            ),

            Positioned(
              top: 110.h,
              left: 160.w,  
              child: ClipOval(
                child: Container(
                  alignment: Alignment.center,
                  color: AppColors.wtColor,
                  height: 64.h,
                  width: 64.w,
                  child: SvgPicture.asset(img!,height: 44,width: 44,color:AppColors.greenColor,)
                ),
              )  
              ),
           orderStatus!= null ?
            Positioned(
               top: 180.h,
               left: 100.w,
              child:Custom_Text(context,text: orderStatus,style: font21White500W(context))
            )
            
            :SizedBox(height: 0.h,),


             Positioned(
               top: orderStatus != null  ? 225.h : 180.h,
               left: 110.w,
              child:Custom_Text(context,text: '  رقم الطلب : #${orderNumber.toString()} ',style: font16White500W(context))
            )



        ],
      )
    )
  );
    }