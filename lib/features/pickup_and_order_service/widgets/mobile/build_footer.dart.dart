


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';

BuildFooter(BuildContext context){

  return Container(
    height: 60,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          custom_Images_asset(image: AppImages.send2,h: 32,w: 32),
                     SizedBox(width: 5,),
          CustomTextField(
                    labelText: MainAppConstants.writeYourMessage,
                  //  controller: messageController,
                    height: 48.h,
                    width: 230.w,
                    borderColor: Colors.grey.shade200,
                    backgroundColor: AppColors.gryColor_11,
                    ),
                               SizedBox(width: 5,),
             custom_Images_asset(image: AppImages.camera,h: 32,w: 32),
             SizedBox(width: 5,),
              custom_Images_asset(image: AppImages.upload,h: 32,w: 32),
      
          
        ],
      ),
    ),
  );
}