import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/text_button.dart';
import 'package:shella_design/util/app_colors.dart';
import '../../../common/widgets/texts/custom_text.dart';
import '../../../util/app_styles.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // details of balance
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(context, text: 'SAR 4,800.09 ', style: font14Black500W(context)),
                      SizedBox(
                        height: 8.h,
                      ),
                      Custom_Text(context, text: '5520 XXXX XXXX 7167', style: font13Green500W(context)),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Custom_Text(context, text: 'قيدها', style: font13Black400W(context)),
                          Custom_Text(context, text: ' | ', style: TextStyle(color: AppColors.gryColor_5)),
                          Custom_Text(context, text: 'متاح', style: font13SecondaryColor400W(context)),
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
            // available balance
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(context,
                    text: 'الرصيد المتاح',
                    style: font13Black400W(
                      context,
                    )),
                SizedBox(
                  height: 8.h,
                ),
                Custom_Text(context,
                    text: 'SAR 5.500.01 ',
                    style: font11Black400W(
                      context,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: AppColors.gryColor_5,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondaryColor),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Custom_Text(context,
                        text: 'حدد البطاقة',
                        style: font13Grey400W(
                          context,
                        )),
                    Spacer(),
                    Custom_Text(context,
                        text: 'SAR 2500 ',
                        style: font13Grey400W(
                          context,
                        )),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
