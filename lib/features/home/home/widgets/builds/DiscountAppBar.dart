import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/home/home/widgets/builds/SearchBarDiscount.dart';
    
class DiscountAppBar extends StatelessWidget {

  const DiscountAppBar({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
          color: AppColors.primaryColor,
          padding: EdgeInsets.only(bottom: 8.h,top: 15.h),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                            SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: IconButton(
              icon: Icon(Icons.arrow_back_sharp, color: AppColors.wtColor, size: 24),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  
                  children: [
                    Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Custom_Text(context, text: "ماركت جرير",size: 11,color: AppColors.wtColor),
                    ),
                    SizedBox(width: 2.w,),
                     ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                         // widget.store.logoUrl,  // test url
                          "https://mediaassets.cbre.com/cdn/-/media/project/cbre/shared-site/menat/saudi-arabia/articles/saudi-arabia-market-review-q2-2024/ksaq22024_report_image.png?iar=0&rev=e2547eb45e9b46eab325aac9f13e5303&key=articlehero-wideimage&device=desktop",
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.store ,size: 20,color: AppColors.wtColor,),
                        ),
                      ),
                  ],
                ),
              ),
                      //      SizedBox(height: 10.h),
                 Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  
                  children: [
                    Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Custom_Text(context, text: " قسم الخصومات",size: 13,color: AppColors.yal2Color),
                    ),
                    SizedBox(width: 2.w,),
                     ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          AppImages.discount2,
                          color: AppColors.yal2Color,
                         // widget.store.logoUrl,
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.store ,size: 20,),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SearchBarDiscount(context)
 
                ),
              
            ],
          ),
        
      
        
      
      
    );
  }
}