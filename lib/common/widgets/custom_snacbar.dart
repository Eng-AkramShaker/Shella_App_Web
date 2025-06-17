import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/custom_toast.dart';


void showCustomSnackBar(String? message,BuildContext context, {bool isError = true, int? showDuration}) {
  if(message != null && message.isNotEmpty) {
    
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.endToStart,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        content: CustomToast(text: message, isError: isError,myContext: context,),
        duration: Duration(seconds: showDuration??2),
        behavior: SnackBarBehavior.floating,
      ));
    
  }
}