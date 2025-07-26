import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/driver_info.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/message_shape.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/pickup_custom_button.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/price_ship.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/write_message_box.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart' show StepProgressIndicator;
    
class NegotiationInfo extends StatefulWidget {

  final String? driverName;
  final String? driverPhoto;
  final String? driverStatus;
  final double? driverRate;
  final double? distance;
  final double? time;
  final String? carType;
  final double? price;
  final int? tripsNumber;
  NegotiationInfo({
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
  _NegotiationInfoState createState() => _NegotiationInfoState();
}

class _NegotiationInfoState extends State<NegotiationInfo> {
  TextEditingController messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: customAppBar(context,title:MainAppConstants.offerNegotiation,img:AppImages.percent1 ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w,vertical: 17.h),
        child: SingleChildScrollView(
           child: Align(
            alignment: Alignment.topRight,
             child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Custom_Text(context,text: MainAppConstants.priceNegotiation,style: font14Black600W(context)),
                  SizedBox(height: 15.h,),
                   Custom_Text(context,text: MainAppConstants.negotiationWithDriver,style: font14Grey400W(context)),
                   SizedBox(height: 15.h,),
                   Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                    //  color: Colors.amber,
                    border: Border.all(
                      color: Colors.grey
                    ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    height: 73,
                    // #todo pass the parameters of driver to driverInfo widget
                    child: DriverInfo(),
                   ),
                   SizedBox(height: 25.h,),
                   Center(
                    child:  Custom_Text(context,text: MainAppConstants.proposedPrice,style: font14Grey400W(context)),
                   ),
                   SizedBox(height: 15.h,),
                    Center(
                    child:  Custom_Text(context,text: widget.price != null ? 'SAR ${widget.price.toString()}' :"SAR 68",style: font24Primary700W(context)),
                   ),
                   SizedBox(height: 25.h,),
                   Custom_Text(context,text: MainAppConstants.proposeNewPrice,style: font14Black400W(context)),
                    SizedBox(height: 15.h,),

                 
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           StepProgressIndicator(
                            progressDirection: TextDirection.rtl,
                              totalSteps: 80,
                              currentStep: widget.price != null ? widget.price!.toInt() : 68,
                              size: 20,
                              padding: 0,
                              selectedColor:AppColors.primaryColor,
                              unselectedColor: Colors.grey.shade300,
                            
                          ),

                           const SizedBox(height: 15), 

                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PriceShip(price: 20,),
                              SizedBox(width: 5,),
                              PriceShip(price: 40),
                               SizedBox(width: 5,),
                              PriceShip(price: 60),
                             SizedBox(width: 5,),
                              PriceShip(price: 80)
                            ],
                           ),

                           const SizedBox(height: 15),

                           MessageShape(isSender: false,messageText: "يمكنني قبول 68 ريال",),
                          const SizedBox(height: 15),
                            MessageShape(isSender: true,messageText: "هل يمكن 60 ريال",),
                               const SizedBox(height: 20),
                          WriteMessageBox(messageController: messageController,)  ,
                          const SizedBox(height: 20),
                          Container(
                            height: 50.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PickupCustomButton(
                                  height: 45.h,
                                  width: 160.w,
                                  text: MainAppConstants.goToAnotherOffer,
                                  borderColor: AppColors.gryColor_11,
                                  textColor: AppColors.secondaryColor,
                                  backgroundColor: AppColors.wtColor,
                                  fontSize: 10,
                                ),
                                  PickupCustomButton(
                                  height: 45.h,
                                  width: 160.w,
                                  text: MainAppConstants.acceptTheOffer,
                                  fontSize: 10,
                                ),
                                
                              ],
                            ),
                          )   
                             
                         ],
                       ),
                    



                ],
              ),
           ),
          
        )
      )
    );
  }
}