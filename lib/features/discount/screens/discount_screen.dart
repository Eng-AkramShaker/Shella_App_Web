import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/mobile/appBar_mobile.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';

import '../../../common/util/app_styles.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: custom_AppBar(context, 'كود الخصم', Icons.arrow_back_sharp, Icons.percent),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/discount.png', width: 30.w, height: 30.h),
              SizedBox(
                height: 10.h,
              ),
              Custom_Text(context,
                  text: 'لا يوجد كود خصم',
                  style: font14SecondaryColor500W(
                    context,
                  )),
              SizedBox(height: 10.h),
              Custom_Text(context,
                  text: 'يمكنك العثور على كود خصم هنا',
                  style: font13Black400W(
                    context,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
