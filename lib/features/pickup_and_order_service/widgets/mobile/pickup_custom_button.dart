import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
    
class PickupCustomButton extends StatefulWidget {
  String? text;
  double? width;
  double? height;
  Color? textColor;
  Color? backgroundColor;
  Color? borderColor;
  String? imageUrl;
  double? imageWidth;
  double? imageHeight;
  double? fontSize;
  Function()? onPressed;
  
   PickupCustomButton({this.text,
  this.width,
  this.height,
  this.textColor,
  this.backgroundColor,
  this.borderColor,
  this.imageUrl,
  this.imageWidth,
  this.imageHeight,
  this.fontSize,
  this.onPressed
  });

  @override
  _PickupCustomButtonState createState() => _PickupCustomButtonState();
}

class _PickupCustomButtonState extends State<PickupCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: widget.height ?? 45,
        width: widget.width ?? double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: widget.borderColor ?? AppColors.primaryColor,
               width: 1),
            ),
          ),
          onPressed: widget.onPressed ?? (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                Custom_Text(
                    context,
                    text: widget.text ?? 'التالي',
                    size: widget.fontSize ?? 14.0,
                    color: widget.textColor ?? AppColors.wtColor,
                 //   style: font10Black600W(context, size: size_10(context)),
                  ),
               const SizedBox(width: 10),
            widget.imageUrl != null ?  custom_Images_asset(
                image: widget.imageUrl ?? AppImages.empty,
                h: widget.imageHeight ?? 30,
                w:   widget.imageWidth ?? 30,
                fit: BoxFit.fill,
              ):SizedBox(width: 0.0,),
              
                ],
              
            
          )
        ),
      ),
    );
  }
}