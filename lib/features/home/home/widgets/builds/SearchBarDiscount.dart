// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/features/home/home/widgets/builds/buildNotificationIcon.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget SearchBarDiscount(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      
         SizedBox(
          height: 29.h,
          width: 223.w,
          child: TextField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: AppColors.wGreyColor),
              hintText: "ابحث عن أي منتج تريده ....",
              hintStyle: font10Grey400W(context),
              filled: true,
              fillColor: AppColors.wtColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            style: font10Black400W(context),
          ),
        ),
      
     // SizedBox(width: 10.w),

       
                    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child:custom_Images_asset(image: AppImages.icon_Star,w: 25,h: 25,fit: BoxFit.contain)
                          ),
                        )
                   //     
                      

      
    ],
  );
}
