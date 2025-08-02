import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/lists.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/chat_app_bar.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/message_shape.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/build_footer.dart.dart';

class InstantChat extends StatefulWidget {
  String? driverPhoto;
   InstantChat({this.driverPhoto});

  @override
  State<InstantChat> createState() => _InstantChatState();
}

class _InstantChatState extends State<InstantChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: ChatAppBar(context),
      bottomNavigationBar: BuildFooter(context),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
              SizedBox(height: 10.h,),
            Center(
              child: 
            Custom_Text(context,text:MainAppConstants.chatIsStarted,style: font14Primary400W(context,size: 12))
            ),
            SizedBox(height: 20.h,),
            MessageShape(isSender: false, messageText: "مرحبا.كيف يمكنني مساعدتك  اليوم؟"),
            SizedBox(height: 10.h,),
           MessageShape(isSender: true, messageText: "كم تستغرق من الوقت لإيصال الطلب"),
           SizedBox(height: 10.h,),
           MessageShape(isSender: false, messageText: "على الموعد تماما بعد 35 دقيقة"),

            
              ]
              
            ),
          ),
        ),
      )
      
      
      );
  }
}