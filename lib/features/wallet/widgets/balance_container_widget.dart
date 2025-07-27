// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/price_converter.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/settings/controllers/custome_info_controller.dart';
import '../../../common/widgets/texts/custom_text.dart';
import '../../../common/util/app_styles.dart';
import '../../settings/controllers/profile_detailes_controller.dart';

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
        child: Consumer<CustomerController>(builder: (context, customerController, _) {
          return Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Custom_Text(context, text: 'الرصيد', style: font14Black600W(context)),
                      Icon(Icons.error_outline),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
          customerController.customer!.walletBalance == null
                      ? PriceConverter.convertPrice2(
                          context,
                          00,
                          textStyle: font14Black600W(context),
                        )
                      : PriceConverter.convertPrice2(
                          context,
            customerController.customer!.walletBalance,
                          textStyle: font14Black600W(context),
                        ),
                ],
              )),
              IconButton(onPressed: () {}, icon: Image.asset('assets/images/wallet.png')),
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                radius: 15.r,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: AppColors.wtColor,
                  ),
                ),
              )
            ],
          );
        }));
  }
}
