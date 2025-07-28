import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/lists.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/delivery_details.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/order_app_bar.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/pickup_custom_button.dart';
    
class ConfirmationOrder extends StatefulWidget {
  const ConfirmationOrder({Key? key}) : super(key: key);

  @override
  _ConfirmationOrderState createState() => _ConfirmationOrderState();
}

class _ConfirmationOrderState extends State<ConfirmationOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: orderAppBar(context,
      appBarHeight: 240,
      hasStatus: true,
      title:MainAppConstants.orderConfirmed,
      orderStatus: MainAppConstants.confirmedSuccessfully,
      orderNumber: 463646,
      img:AppImages.done ),
      body: Container(
        child: SingleChildScrollView(
          child:
           Padding(
             padding: const EdgeInsets.symmetric( horizontal: 10,vertical: 10),
             child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
             child: Custom_Text(context,text: MainAppConstants.deliveryDetails,style: font16Black500W(context))
                  ),
                ),
                SizedBox(height: 10.h,),
                Divider(),
                DeliveryDetails(),
                SizedBox(height: 25.h,),
                Center(
                  child: PickupCustomButton(
                    text: MainAppConstants.orderTracking,
                    imageUrl: AppImages.truckicon,
                    
                  ),
                ),
                SizedBox(height: 25.h,),

                 Center(
                  child: 
        InkWell(
          onTap: () {
            
          },
          child: Custom_Text(context,text: MainAppConstants.backToMain,
          style: font14SecondaryColor500W(context))),

                )
              ],
                       ),
           ),
        ),
      ),
    );
  }
}