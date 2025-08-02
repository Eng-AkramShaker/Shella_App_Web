import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
    
class DriverInfo extends StatelessWidget {
   final String? driverName;
  final String? driverPhoto;
  final String? driverStatus;
  final double? driverRate;
  final double? distance;
  final double? time;
  final int? tripsNumber;

   DriverInfo({
     this.driverName,
        this.driverPhoto,
        this.driverStatus,
        this.driverRate,
        this.distance,
        this.time,
        this.tripsNumber
    });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
                    height: 50.h,
                    child: Expanded(
                      child: Row(
                        children: [
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
                          Column(
                            children: [
                              Custom_Text(context,text: driverName ?? "Mohamed",underline: false,style: font14Black600W(context),size: 16),
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  custom_Images_asset(
                                  image: AppImages.icon_Star,
                                  h: 12,
                                  w: 12,
                                ),
                                SizedBox(width: 5.w,),
                                Custom_Text(context,text: driverRate!= null ? driverRate.toString(): 4.5.toString() ),
                                SizedBox(width: 5.w,),
                                Custom_Text(context,text: tripsNumber!= null ? '(${tripsNumber.toString()} رحلة)': '(${212.toString()} رحلة)' ),
                                ],)
      
                            ],
                          ),
                          SizedBox(width: 5.w,),
                          Column(
                             children: [
                              Row(
                                children: [
                                   custom_Images_asset(
                                  image: AppImages.rank,
                                  h: 14,
                                  w: 14,
                                ),
                              SizedBox(width: 5.w,),
                               Custom_Text(context,text: driverStatus ?? "سائق بلاتيني" ,color:Colors.blue.shade700 ),
                                ],
                              )
                             ],
                          ),
                           SizedBox(width: 35.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.place,size: 14,color: AppColors.greenColor,),
                                    SizedBox(width: 8.w,),
                                    Custom_Text(context,style: font13Black400W(context),text: distance!= null ? '${distance.toString()} كم' : "1.1 كم ")
                                  ],
                                ),
                                Row(
                                   children: [
                                    Icon(Icons.timer,size: 14,color: AppColors.greenColor,),
                                    SizedBox(width: 8.w,),
                                    Custom_Text(context,style: font13Black400W(context),text: time!= null ? '${time.toString()} دقيقة' : "3 دقيقة ")
                                  ],
                                )
                              ],
                          )
                        ],
                      )
                      ),
                  ),
    );
  }
}