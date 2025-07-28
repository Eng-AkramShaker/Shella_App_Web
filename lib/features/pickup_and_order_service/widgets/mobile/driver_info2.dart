import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
    
class DriverInfo2 extends StatelessWidget {

   final String? driverName;
  final String? driverPhoto;
  final String? driverStatus;
  final double? driverRate;
  final String? carType;
  
   DriverInfo2({
     this.driverName,
        this.driverPhoto,
        this.driverStatus,
        this.driverRate,
        this.carType    
    });
  


  
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
                    height: 60.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Expanded(
                      child: Row(
                        children: [
                          SizedBox(width: 5,),
                          Container(
                            alignment: Alignment.topCenter,
                              child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                          driverPhoto!= null ? driverPhoto! :
                           "https://mediaassets.cbre.com/cdn/-/media/project/cbre/shared-site/menat/saudi-arabia/articles/saudi-arabia-market-review-q2-2024/ksaq22024_report_image.png?iar=0&rev=e2547eb45e9b46eab325aac9f13e5303&key=articlehero-wideimage&device=desktop",
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Icon(Icons.person),
                          ),
                        ),
                          
                          ),
                          SizedBox(width: 12.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Custom_Text(context,text: driverName ?? "أحمد محمد",underline: false,style: font14Black600W(context)),
                              SizedBox(height: 6.h,),
                              Custom_Text(context,text: carType ?? "Toyota-Corolla White",underline: false,style: font14Primary400W(context)),

      
                            ],
                          ),
                      
                         SizedBox(width: 75.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    custom_Images_asset(
                                  image: AppImages.icon_Star,
                                  h: 12,
                                  w: 12,
                                ),
                                SizedBox(width: 5.w,),
                                Custom_Text(context,style: font12Black400W(context),text: driverRate!= null ? driverRate.toString(): 4.5.toString() ),
                                  ],
                                ),
                                SizedBox(height: 6,),
                                Custom_Text(context,style: font12Black400W(context),text:" ABC 123 ")
                              ],
                          )
                        ],
                      )
                      ),
                  ),
    );
  }
}