import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/Auth/widgets/mobile/builds_mobile/build_label_mobile.dart';
    
class MaterialsDetails extends StatefulWidget {
  const MaterialsDetails({Key? key}) : super(key: key);

  @override
  _MaterialsDetailsState createState() => _MaterialsDetailsState();
}

class _MaterialsDetailsState extends State<MaterialsDetails> {
      TextEditingController sizeController = TextEditingController();
      TextEditingController piecesNumberController = TextEditingController();
      TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Custom_Text(context,text:MainAppConstants.materialsDetails,style: font16Black500W(context)),
             SizedBox(height: 10.h,),
             // approximate size
             buildLabel(MainAppConstants.approximateSize, context),
              SizedBox(height: 10.h,),
              CustomTextField(
                labelText: MainAppConstants.approximateSize,
                controller: sizeController,
                height: 44.h,
                borderColor: Colors.grey.shade200,
                ),
                 SizedBox(height: 10.h,),
              // number of pieces   
                buildLabel(MainAppConstants.numberOfPieces, context),
              SizedBox(height: 10.h,),
              CustomTextField(
                labelText: MainAppConstants.numberOfPieces,
                controller: piecesNumberController,
                height: 44.h,
                borderColor: Colors.grey.shade200,
                ), 
                SizedBox(height: 10,),
               TextFormField(
                controller: notesController,
                decoration: InputDecoration(
                  hintText: MainAppConstants.additionalNotes,
                  hintStyle:font12Grey400W(context) ,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular( 8.r),
                    borderSide: BorderSide(
                        color: Colors.grey.shade200,
                        width:1)),
                   focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                    color: AppColors.greenColor,
                    )),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
              
                ),
                maxLines: null, 
                minLines: 4, 
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some notes';
                  }
                  return null;
                },
              ),  

             ],
      ),
    );
  }
}