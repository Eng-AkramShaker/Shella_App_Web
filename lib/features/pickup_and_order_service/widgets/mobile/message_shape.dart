import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
    
class MessageShape extends StatelessWidget {
  bool isSender = false;
  String messageText;


   MessageShape({required this.isSender,required this.messageText});
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ?Alignment.topRight :Alignment.topLeft,
      child: IntrinsicWidth(
        child: Container(
      height: 36.h,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
      color: isSender ? AppColors.primaryColor : AppColors.gryColor_11,
      borderRadius: BorderRadius.circular(12),
      ),
      child: Custom_Text(context,text: messageText,style: font14Black500W(context)),
      
        ),
      ),
    );
  }
}