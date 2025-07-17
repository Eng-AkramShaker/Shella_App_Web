import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/texts/custom_text.dart';
import '../../../common/util/app_colors.dart';
import '../../../common/util/app_styles.dart';
import '../widgets/chat_screen.dart';

class SupportConversationScreen extends StatelessWidget {
  const SupportConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.backgroundColor,
        title: Custom_Text(
          context,
          text: 'تواصل معنا',
          style: font14Green400W(context),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.gryColor_5, width: 1))),
            child: Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image.asset('assets/images/free-chat-support-icon-1721-thumb 1.png'),
                    Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(color: AppColors.greenColor, shape: BoxShape.circle),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Custom_Text(
                      context,
                      text: 'خدمة العملاء shella اونلاين',
                      style: font13Black400W(context),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Custom_Text(
                      context,
                      text: 'الخدمة متاحة على مدار 24 ساعة',
                      style: font10Black400W(context),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.cancel_outlined, color: AppColors.gryColor_5))
              ],
            ),
          ),
          Expanded(child: ChatScreen()),
        ],
      ),
    );
  }
}
