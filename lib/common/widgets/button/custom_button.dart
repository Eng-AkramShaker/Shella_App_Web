import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import '../loading/loading.dart';
import '../texts/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text,
    this.isSelected,this.onTap, this.color, this.colorTxt, this.isGradient, this.textSize, this.textWeight, this.colorBorder, this.width, this.height, this.secondColor, this.widget, this.paddingRight, this.circular, this.widget2, this.endGradient, this.isSpacer, this.borderWidth, this.isPrimary, this.paddingLeft, this.removeGap, this.isLoading, this.loadingColor});

  final String text;
  final double? textSize;
  final double? width;
  final double? height;
  final FontWeight? textWeight;
  final bool? isSelected;
  final bool? isGradient;
  final bool? isSpacer;
  final bool? isPrimary;
  final bool? isLoading;
  final bool? removeGap;
  final Color? color;
  final Color? secondColor;
  final Color? colorBorder;
  final Color? colorTxt;
  final Color? loadingColor;
  final Widget? widget;
  final Widget? widget2;
  final double? paddingRight;
  final double? paddingLeft;
  final double? circular;
  final double? borderWidth;
  final AlignmentGeometry? endGradient;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height:height??45,
            width: width??MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(circular??10),
              color: isSelected==true?AppColors.bgColor:color,
              border: isPrimary==true?Border.all(color: AppColors.wtColor.withValues(alpha: 0.25),width: borderWidth??3,):isSelected==false?null:colorBorder!=null?Border.all(color: colorBorder!,width: borderWidth??1):null,
              gradient:isGradient==true? LinearGradient(
                colors: [
                  secondColor!,
                  color!,
              ],
                end: endGradient??Alignment.centerRight
              ):null
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right:paddingRight??0,left: paddingLeft??0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget??const SizedBox(height: 0),
                    if(widget!=null)
                      if(removeGap!=true)
                        SizedBox(width: 5,),
                    Custom_Text(context,text:
                      text,textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: textWeight??FontWeight.w400,fontSize: textSize??14,color: colorTxt??AppColors.bgColor),
                      ),
                    if(widget2!=null)
                      SizedBox(width: 5,),
                    if(isSpacer==true)
                    const Spacer(),
                    widget2??const SizedBox(height: 0),
                  ],
                ),
              ),
            )),
        ),
        if(isLoading==true)
          Loading(color: loadingColor,)
      ],
    );
  }
}
