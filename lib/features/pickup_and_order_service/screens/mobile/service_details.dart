import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/custom_checkbox_group.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/materials_details.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/pickup_custom_button.dart';
    
class ServiceDetails extends StatefulWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black.withOpacity(0.5),
     appBar: AppBar(
      automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(0.5),
         elevation: 0, 
         ),
        body: Container(
        
        color:Colors.black.withOpacity(0.5), // Ensures body is transparent
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height * 0.84,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12) ,topRight: Radius.circular(12)),
          color: AppColors.wtColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // service type
              CustomCheckboxGroup(title: MainAppConstants.serviceType,
               options: 
               [
                MainAppConstants.furnitureTransport,
               MainAppConstants.goodsTransport,
               MainAppConstants.packetsDelivery
               ],
               ),
               // loading type
              CustomCheckboxGroup(title: MainAppConstants.loadingType,
               options: 
               [
                MainAppConstants.loadingOnly,
               MainAppConstants.loadingAndUnloading,
               ],
               ),
                  //packet statue
                CustomCheckboxGroup(title: MainAppConstants.packetStatue,
               options: 
               [
                MainAppConstants.breakable,
               ],
               ),
               //materials details
               MaterialsDetails(),
               SizedBox(height: 15.h,),
               PickupCustomButton(text: MainAppConstants.done,height: 45,onPressed: () {
                 nav.back();
               },)
            

            ],
          ),
        ),
      ),
    );
  }
}