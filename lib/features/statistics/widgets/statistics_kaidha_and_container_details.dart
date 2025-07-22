import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/util/app_colors.dart';
import '../../../common/widgets/texts/custom_text.dart';
import '../../../common/util/app_styles.dart';

class StatisticsKaidhaAndContainerDetails extends StatelessWidget {
  const StatisticsKaidhaAndContainerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(context,
            text: 'إحصائيات خدمة قيدها',
            style: font14Black400W(
              context,
            )),
        SizedBox(
          height: 16.h,
        ),
        Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: AppColors.primaryColor),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(context,
                        text: 'المبلغ المقدم من قيدها',
                        style: font13White400W(
                          context,
                        )),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      children: [
                        custom_Images_asset(image: 'assets/images/wallet.png', w: 29, h: 24),
                        SizedBox(
                          width: 5.w,
                        ),
                        Custom_Text(context,
                            text: '5.5 رس',
                            style: font13White400W(
                              context,
                            )),
                      ],
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Custom_Text(context,
                        text: 'المبلغ المتاح للشراء',
                        style: font13White400W(
                          context,
                        )),
                    SizedBox(
                      height: 35.h,
                    ),
                    Custom_Text(context,
                        text: '5.5 رس',
                        style: font13White400W(
                          context,
                        )),
                  ],
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
