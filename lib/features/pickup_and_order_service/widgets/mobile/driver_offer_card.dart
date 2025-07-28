import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/driver_info.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/pickup_custom_button.dart';
    
class DriverOfferCard extends StatelessWidget {
  final String? driverName;
  final String? driverPhoto;
  final String? driverStatus;
  final double? driverRate;
  final double? distance;
  final double? time;
  final String? carType;
  final double? price;
  final int? tripsNumber;
  DriverOfferCard({
        this.driverName,
        this.driverPhoto,
        this.driverStatus,
        this.driverRate,
        this.distance,
        this.time,
        this.carType,
        this.price,
        this.tripsNumber}  
   );
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
           width: MediaQuery.of(context).size.width,
           height: 160.h, 
                      decoration: BoxDecoration(
                        color:AppColors.wtColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
            child: Column(
              children: [
              DriverInfo(),
                 Container(
                  height: 35.h,
               //   color: Colors.green,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                   Custom_Text(context,size: 18,text: price!= null ? 'SAR ${price.toString()}' : "SAR 68"),
                   Row(
                    children: [
                      Icon(Icons.local_taxi_outlined,size: 14,color: AppColors.greenColor,),
                      SizedBox(width: 8.w,),
                      Custom_Text(context,style: font13Black400W(context),text: carType ?? "Chevrolet Aveo")
                    ],)

                      ],
                    )
                    ),
                ),
                 Container(
                  height: 45.h,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PickupCustomButton(height: 38,
                        width: 124,
                        text: MainAppConstants.accept,
                        onPressed: () {
                          
                        },
                        ),
                        PickupCustomButton(
                        height: 38,
                        width: 124,
                        text: MainAppConstants.negotiate,
                        backgroundColor: AppColors.backgroundColor,
                        textColor: AppColors.secondaryColor,
                        borderColor: AppColors.secondaryColor,
                        onPressed: () {
                          nav.push(AppRoutes.negotiationInfo);
                        },
                        )
                      ],
                    )
                    ),
                ),
                
              ],
            ),
          ),            
        ),
      ),
    );
  }
}