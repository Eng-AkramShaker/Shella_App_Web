import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/driver_info2.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/order_app_bar.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/order_timeline.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/pickup_custom_button.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/tracking_map.dart';
    
class TrackingPickUpOrder extends StatefulWidget {
  const TrackingPickUpOrder({Key? key}) : super(key: key);

  @override
  _TrackingPickUpOrderState createState() => _TrackingPickUpOrderState();
}

class _TrackingPickUpOrderState extends State<TrackingPickUpOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.wtColor,
      appBar: orderAppBar(
        context,
        hasStatus: false,
      appBarHeight: 190,
    title:MainAppConstants.orderTracking,
     orderStatus:"",
      orderNumber: 463646,
      img:AppImages.truckiconsvg
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 300.h,
                width: double.infinity,
                child: OrderTimeline(),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(5),
                height: 40.h,
                decoration: BoxDecoration(
                color: AppColors.gryColor_3,
                borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Custom_Text(context,text:'${MainAppConstants.expectedArrival} : 15 دقيقة',style: font12Grey400W(context)),
                  Row(
                  children: [
                  Custom_Text(context,text:MainAppConstants.orderConfirmedIsDone,style: font12Black400W(context)),
                  SizedBox(width: 5.w,),
                  ClipOval(
                 child: Container(
                 width: 8,
                 height: 8,
                 color: Colors.green,
                 ),
                 )
            ], )
                    ],
                ),
              ),
           SizedBox(height: 12.h),

           DriverInfo2(),

           SizedBox(height: 8.h),

          TrackingMap(),

          SizedBox(height: 8.h,),
        
           Container( height: 50.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PickupCustomButton(
                                  height: 45.h,
                                  width: 160.w,
                                  text: MainAppConstants.message,
                                  borderColor: AppColors.primaryColor,
                                  textColor: AppColors.primaryColor,
                                  backgroundColor: AppColors.wtColor,
                                  imageHeight: 20,
                                  imageWidth: 20,
                                  imageUrl: AppImages.message,
                                  fontSize: 14,
                                  onPressed: () {
                                    nav.push(AppRoutes.instantChat);
                                  },
                                ),
                                  PickupCustomButton(
                                  height: 45.h,
                                  width: 160.w,
                                  borderColor: AppColors.primaryColor,
                                  textColor: AppColors.primaryColor,
                                  backgroundColor: AppColors.wtColor,
                                 imageUrl: AppImages.call,
                                 imageHeight: 20,
                                  imageWidth: 20,
                                  text: MainAppConstants.contact,
                                  fontSize: 14,
                                ),
                                
                              ],
                            ),
                          ),

                           SizedBox(height: 25.h,),

                 Center(
                  child: 
                    InkWell(
                  onTap: () {  },
                   child: Custom_Text(context,text: MainAppConstants.backToMain,
                    style: font14SecondaryColor500W(context))),
                    ) ,
                    SizedBox(height: 10.h,)  

          
          
          
            ],
          ),
        ),
      ),
    );
  }
}