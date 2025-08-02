import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/pickup_custom_button.dart';
    
class KeyboardDialog extends StatefulWidget {
  final TextEditingController priceController;
   KeyboardDialog({required this.priceController});

  @override
  _KeyboardDialogState createState() => _KeyboardDialogState();
}

class _KeyboardDialogState extends State<KeyboardDialog> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.priceController.text="ريال";
  }

  String extractDigits(String input) {
  return input.replaceAll(RegExp(r'[^0-9]'), '');
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
       10
      ),
      child: SingleChildScrollView(
        child: Container(
          height: 500.h,
          width: ResponsiveLayout.isWeb()
              ? MediaQuery.of(context).size.width / 3
              : MediaQuery.of(context).size.width, // Take full screen width
          
          decoration: BoxDecoration(
              borderRadius: ResponsiveLayout.isWeb()
                  ? BorderRadius.circular(8.r)
                  : BorderRadius.circular(0.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 20.w,),
                  Custom_Text(context,
                      text: MainAppConstants.showSuitablePriceForYou,
                      style: font20Black700W(context,size: 14)),

                      InkWell(
                        onTap: () {
                          nav.back();
                        },
                        child: Icon(Icons.cancel_outlined,color: AppColors.bgColor,size: 30,)
                        )
                ],
              ),
              SizedBox(height: 15.h),

              SizedBox(
                height: 80,
                child: TextFormField(
                  textAlign: TextAlign.center,
                   keyboardType: TextInputType.none, 
                  controller: widget.priceController,
                  style: font20Black700W(context,size: 30),
                  decoration: InputDecoration(
                
                  ),
                ),
              ),

              SizedBox(height: 10.h,),
              PickupCustomButton(text: MainAppConstants.done,
              onPressed: () {
                 String digitsOnly = extractDigits(widget.priceController.text);
                 widget.priceController.text=digitsOnly;
                 print("Digits only: '${widget.priceController.text}' "); 
                 nav.back();
              },
              ),
              SizedBox(height: 10.h,),

                NumericKeyboard(
              onKeyboardTap: (value) => setState(() => widget.priceController.text += value),
              rightButtonFn: () {
                if (widget.priceController.text.isNotEmpty) {
                  setState(() {
                    widget.priceController.text = widget.priceController.text.substring(
                      0, widget.priceController.text.length - 1);
                  });
                }
              },
              rightIcon: Icon(Icons.backspace, color:AppColors.bgColor),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textColor: AppColors.bgColor,
            ),
            ]
          ),
        ),
      ),
    ) ;
  }
}