import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
    
class WriteMessageBox extends StatelessWidget {

  TextEditingController messageController;

  WriteMessageBox({required this.messageController});
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
                 Expanded(
                  flex: 1,
                   child: ClipOval(
                        child: Container(
                          width: 48.w,
                          height: 48.h,
                          color: AppColors.primaryColor,
                          child: Center(
                            child: SvgPicture.asset(AppImages.sendicon,height: 24,width: 24,)
                            )
                          )
                      ),
                 ),
                     SizedBox(width: 10.w,),

                   Expanded(
              flex: 5,
               child: CustomTextField(
                  labelText: MainAppConstants.writeYourMessage,
                  controller: messageController,
                  height: 48.h,
                  borderColor: Colors.grey.shade200,
                  backgroundColor: AppColors.gryColor_11,
                  ),
             ),

          ],
        ),
    );
     
  }
}