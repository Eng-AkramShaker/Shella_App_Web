import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/accept_partner.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/header_of_looking_driver.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/offer_rectangle.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/pickup_custom_button.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
    
class LookingForDriver extends StatefulWidget {
  const LookingForDriver({Key? key}) : super(key: key);

  @override
  _LookingForDriverState createState() => _LookingForDriverState();
}

class _LookingForDriverState extends State<LookingForDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                HeaderOfLookingDriver(),
                SizedBox(height: 10.h,),
                Center(child: Custom_Text(context,text:MainAppConstants.sendOrderToDrivers,style: font20Black700W(context))),
                SizedBox(height: 15.h,),
                // progress indicator
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:8.0),
                   child: StepProgressIndicator(
                   progressDirection: TextDirection.rtl,
                   totalSteps: 80,
                   currentStep: 15,
                   size: 15,
                   padding: 0,
                   selectedColor:AppColors.primaryColor,
                   unselectedColor: AppColors.gryColor_12,             
                            ), ),
                 SizedBox(height: 10.h,),
                 Center(child: Custom_Text(context,text: MainAppConstants.yourOffer,style: font16Grey600W(context)),),
                 SizedBox(height: 10.h,),
                 OfferRectangle(OfferPrice: 68.0,decreasePrice: 10.0,increasePrice: 10.0,),
                 SizedBox(height: 10.h,),
                 AcceptPartner(),
                 SizedBox(height:10.h),
                 Container(
                  padding: EdgeInsets.symmetric(horizontal:  10.0),
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children:[
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.gryColor_12,
                        child: Icon(Icons.timer,size: 28,),
                      ),
                      SizedBox(width: 12.w,),
                      Column(
                        children: [
                          Custom_Text(context,text: MainAppConstants.deliveryPeriod,style: font13Grey500W(context)),
                          SizedBox(height: 10.h,),
                          Custom_Text(context,text: "25 دقيقة",style: font16Black500W(context)),
                        ],
                      )
                    ]
                  )
                 ),

                 SizedBox(height: 10.h,),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: PickupCustomButton(text: MainAppConstants.increaseFee,height: 48.h,fontSize: 16,),
                 ),
                 SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: PickupCustomButton(text: MainAppConstants.cancelOrder,
                  height: 48.h,
                  fontSize: 16,
                  textColor: AppColors.secondaryColor,
                  borderColor: AppColors.secondaryColor,
                  backgroundColor: AppColors.backgroundColor,),
                ),


                 




              ],
              
            ),
          ),
        ),
      ),
    );
  }
}