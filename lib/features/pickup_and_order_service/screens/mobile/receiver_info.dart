import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_label_mobile.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_phone_field_mobile.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/pickup_custom_button.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/select_address_on_map.dart';

class ReceiverInfo extends StatefulWidget {
  final Map<String, dynamic> formData;
  final VoidCallback onPrevious;
  final VoidCallback onSubmit;
  const ReceiverInfo({super.key,required this.formData,
    required this.onPrevious,
    required this.onSubmit,});

  @override
  State<ReceiverInfo> createState() => _ReceiverInfoState();
}

class _ReceiverInfoState extends State<ReceiverInfo> {
  TextEditingController detailsController2 = TextEditingController();
    TextEditingController addressController2 = TextEditingController();
    TextEditingController streetnameController2 = TextEditingController();
    TextEditingController areanameController2 = TextEditingController();
    TextEditingController houseController2 = TextEditingController();
    TextEditingController blockController2 = TextEditingController();
    TextEditingController receivernameController = TextEditingController();
    TextEditingController phoneController2 = TextEditingController();




    @override
void initState() {
  super.initState();
  addressController2.addListener(_handleTextChanged);
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
                  onTap: () { },
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
                controller: detailsController2,
                height: 44.h,
                borderColor: Colors.grey.shade200,
                suffixIcon: Icon(Icons.info,color: AppColors.wGreyColor,),
                ) ,

                 SizedBox(height: 10.h,),
                // map
                GoogleMapsLocationPicker(addressController: addressController2),
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
                controller: streetnameController2,
                height: 44.h,
                borderColor: Colors.grey.shade200,
                ),
                 SizedBox(height: 10.h,),
                 // area name
                  buildLabel(MainAppConstants.areaName, context),
                  SizedBox(height: 10.h,), 
                   CustomTextField(
                labelText: MainAppConstants.areaName,
                controller: areanameController2,
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
                controller: houseController2,
                height: 44.h,
                width: MediaQuery.of(context).size.width * 0.41,
                borderColor: Colors.grey.shade200,
                ),
                 SizedBox(width: 10.h,),
                 //block
                 CustomTextField(
                labelText: MainAppConstants.block,
                controller: blockController2,
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
                         text:MainAppConstants.receiverInfo,
                         underline: false,
                         style: font14Primary400W(context)
                    ),
                  ),

                  //sender name
                   SizedBox(height: 10.h,),
                  buildLabel(MainAppConstants.receiverName, context),
                  SizedBox(height: 10.h,),
                   CustomTextField(
                labelText: MainAppConstants.senderName,
                controller: receivernameController,
                height: 44.h,
                borderColor: Colors.grey.shade200,
                ),
                //phone number
                SizedBox(height: 10.h,),
                  buildLabel(MainAppConstants.phoneNumber, context),
                  SizedBox(height: 10.h,),
                   buildPhoneField(phoneController2),
                   SizedBox(height: 10.0,),
                   PickupCustomButton(text:MainAppConstants.nextWord,onPressed: () {
                      if (true
                     //   Form.of(context)!.validate()
                        ) {
                // Form.of(context)!.save();
                widget.onSubmit();
              }
                   },)
  
          ],
        ),
      ),
    );
  }
}