import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_label_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_phone_field_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_text_field_mobile.dart';
import 'package:shella_design/features/orders/widgets/builds/build_title_order.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/service_details.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/pickup_custom_button.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/select_address_on_map.dart';

class SenderInfo extends StatefulWidget {

  final Map<String, dynamic> formData;
  final VoidCallback onNext;
   const SenderInfo({super.key,required this.formData,required this.onNext});

  @override
  State<SenderInfo> createState() => _SenderInfoState();
}

class _SenderInfoState extends State<SenderInfo> {

    TextEditingController detailsController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController streetnameController = TextEditingController();
    TextEditingController areanameController = TextEditingController();
    TextEditingController houseController = TextEditingController();
    TextEditingController blockController = TextEditingController();
    TextEditingController sendernameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();




    @override
void initState() {
  super.initState();
  addressController.addListener(_handleTextChanged);
}

void _handleTextChanged() {
  setState(() {
    // This will rebuild the parent when text changes
  });
}


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [ 
                Custom_Text(context,
                text:MainAppConstants.takingPosition,
                underline: false,
                style: font14Black500W(context)
                ),
        
                Container(
                child: InkWell(
                  onTap: () { 
                  //  nav.push(AppRoutes.pickupServiceDetails);
                    Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false, // Makes the route transparent
                  pageBuilder: (_, __, ___) =>  ServiceDetails(),
                ),
              );
                  },
                  child: Row(
                  children: [
                    Icon(Icons.add,color: AppColors.primaryColor,size: 20,),
                    SizedBox(width: 5.w,),
                    Custom_Text(context,
                       text:MainAppConstants.addNew,
                       underline: false,
                       style: font14Primary400W(context)
                  ),
                    ],
                    ),
                ),
                ),
               
                
           ]
            ),
             SizedBox(height: 10.h,),
          // details text field
               CustomTextField(
                labelText: MainAppConstants.serviceDetails,
                controller: detailsController,
               // validator: (value) => value!.isEmpty ? 'Required' : null,
              //   onSaved: (value) => formData['field3'] = value,
                height: 44.h,
                borderColor: Colors.grey.shade200,
                suffixIcon: Icon(Icons.info,color: AppColors.wGreyColor,),
                ) ,

                 SizedBox(height: 10.h,),
                // map
                GoogleMapsLocationPicker(addressController: addressController),
                 SizedBox(height: 2.h,),
                 //explain address section
                  Center(
                    child: Custom_Text(context,
                         text:MainAppConstants.explainYourAddress,
                         underline: false,
                         style: font14Primary400W(context)
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  // street name
                  buildLabel(MainAppConstants.streetName, context),
                  SizedBox(height: 10.h,),
                   CustomTextField(
                labelText: MainAppConstants.streetName,
                controller: streetnameController,
                height: 44.h,
                borderColor: Colors.grey.shade200,
                ),
                 SizedBox(height: 10.h,),
                 // area name
                  buildLabel(MainAppConstants.areaName, context),
                  SizedBox(height: 10.h,), 
                   CustomTextField(
                labelText: MainAppConstants.areaName,
                controller: areanameController,
                height: 44.h,
                borderColor: Colors.grey.shade200,
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //house
                     CustomTextField(
                labelText: MainAppConstants.house,
                controller: houseController,
                height: 44.h,
                width: MediaQuery.of(context).size.width * 0.41,
                borderColor: Colors.grey.shade200,
                ),
                 SizedBox(width: 10.h,),
                 //block
                 CustomTextField(
                labelText: MainAppConstants.block,
                controller: blockController,
                height: 44.h,
                width: MediaQuery.of(context).size.width * 0.41,
                borderColor: Colors.grey.shade200,
                ),
                  ],
                  ),
               SizedBox(height: 10.h,),
                // sender info
                  Center(
                    child: Custom_Text(context,
                         text:MainAppConstants.senderInfo,
                         underline: false,
                         style: font14Primary400W(context)
                    ),
                  ),

                  //sender name
                   SizedBox(height: 10.h,),
                  buildLabel(MainAppConstants.senderName, context),
                  SizedBox(height: 10.h,),
                   CustomTextField(
                labelText: MainAppConstants.senderName,
                controller: sendernameController,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                height: 44.h,
                borderColor: Colors.grey.shade200,
                ),
                //phone number
                SizedBox(height: 10.h,),
                  buildLabel(MainAppConstants.phoneNumber, context),
                  SizedBox(height: 10.h,),
                   buildPhoneField(phoneController),
                   SizedBox(height: 10.0,),
                   PickupCustomButton(text:MainAppConstants.continueWord,onPressed: () {
                      if (Form.of(context)!.validate()) {
                Form.of(context)!.save();
                widget.onNext();
              }
                   },)
  
          ],
        ),
      ),
    );
  }
}