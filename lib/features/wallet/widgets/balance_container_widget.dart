import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/Balance/screens/mobile/add_credit.dart';
import 'package:shella_design/features/Balance/screens/mobile/balance_transfer.dart';
import 'package:shella_design/features/Balance/screens/web/add_balance_widget.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import '../../../common/widgets/texts/custom_text.dart';
import '../../../common/util/app_styles.dart';

class BalanceContainerWidget extends StatelessWidget {
  const BalanceContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.wtColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 0, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Offset from the container
          ),
        ],
      ),
      padding: EdgeInsets.all(16.sp),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Custom_Text(context,
                      text: 'الرصيد',
                      style: font14Black600W(
                        context,
                      )),
                  Icon(Icons.error_outline)
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Custom_Text(context,
                  text: '0.00 رس .',
                  style: font14Black600W(
                    context,
                  )),
            ],
          )),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const BalanceTransfer(),
                );
              },
              icon: Image.asset('assets/images/wallet.png')),
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 15.r,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ResponsiveLayout.isWeb()
                      ? const AddBalanceWidget()
                      : const AddCredit(),
                );
              },
              icon: Icon(
                Icons.add,
                color: AppColors.wtColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
