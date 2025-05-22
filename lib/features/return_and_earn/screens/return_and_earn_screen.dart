import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/mobile/appBar_mobile.dart';
import 'package:shella_design/features/return_and_earn/widgets/invite_friends_text_and_personal_code.dart';
import 'package:shella_design/common/util/app_colors.dart';
import '../../../common/widgets/texts/custom_text.dart';
import '../../../common/util/app_styles.dart';

class ReturnAndEarnScreen extends StatelessWidget {
  const ReturnAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: custom_AppBar(context, 'الرجوع و الكسب', Icons.arrow_back_sharp, Icons.person_outline_outlined),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/return_and_earn.png'),
              SizedBox(height: 25.h),
              Custom_Text(context, text: 'كسب المال على كل إحالة', style: font13Grey400W(context)),
              SizedBox(height: 5.h),
              Custom_Text(context, text: '1 إحالة = 20.0 ر.س', style: font13Black400W(context)),
              SizedBox(height: 60.h),
              InviteFriendsTextAndPersonalCode()
            ],
          ),
        ),
      ),
    );
  }
}
