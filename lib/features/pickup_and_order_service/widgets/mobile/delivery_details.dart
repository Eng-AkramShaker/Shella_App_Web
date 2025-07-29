import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
    
class DeliveryDetails extends StatelessWidget {
  String? expectedArrivalTime;
  double? distance;
  double? subtotal;
  double? deliveryFees;
  double? cashFees;
  double? total;
   DeliveryDetails({
    this.expectedArrivalTime,
    this.distance,
    this.deliveryFees,
    this.subtotal,
    this.cashFees,
    this.total
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // --------------------------------expected arrival time-----------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
         Custom_Text(context,text: MainAppConstants.expectedArrivalTime,style: font14Black400W(context)),

         Row(
              children: [
              Custom_Text(context,style: font14Primary400W(context),text: expectedArrivalTime!= null ? '${expectedArrivalTime} دقيقة' : "40-45 دقيقة "),
              SizedBox(width: 8.w,),
              Icon(Icons.timer_outlined,size: 14,color: AppColors.greenColor,),
                  ],
              )
          ],),
          SizedBox(height: 12.h,),
  /// -------------------------------distance-----------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
         Custom_Text(context,text: MainAppConstants.distance,style: font14Black400W(context)),

         Row(
              children: [
              Custom_Text(context,style: font14Primary400W(context),text: distance!= null ? ' km ${distance.toString()}' : "km 10.72 "),
              SizedBox(width: 8.w,),
              Icon(Icons.location_on_outlined,size: 14,color: AppColors.greenColor,),
                  ],
              )
          ],),

          Divider(),
///-------------------------subtotal----------------------------
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
         Custom_Text(context,text: MainAppConstants.subtotal,style: font14Black400W(context)),
        Custom_Text(context,style: font14Black400W(context),text: subtotal!= null ? ' ريال ${subtotal!.toInt().toString()}' : "90 ريال "), 
         ] 
         ),
         Divider(),
  ///----------------------------------delivery fees-------------------------------------       
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
         Custom_Text(context,text: MainAppConstants.deliveryFees,style: font14Black400W(context)),
        Custom_Text(context,style: font14Black400W(context),text: deliveryFees!= null ? ' ريال ${deliveryFees!.toInt().toString()}' : "5 ريال "), 
         ] 
         ),
         Divider(),
   ///--------------------------------cash on delivery fees---------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
         Custom_Text(context,text: MainAppConstants.cashOnDeliveryFees,style: font14Black400W(context)),
        Custom_Text(context,style: font14Black400W(context),text: cashFees!= null ? ' ريال ${cashFees!.toInt().toString()}' : "5 ريال "), 
         ] 
         ),
         Divider(),
///------------------------------------total-----------------------------------
         
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
         Custom_Text(context,text: MainAppConstants.total,style: font14Black400W(context)),
        Custom_Text(context,style: font14Primary400W(context),text: total!= null ? ' ريال ${total!.toInt().toString()}' : "105 ريال "), 
         ] 
         ),
         Divider(),  
        ],
      ),

      
    );
  }
}