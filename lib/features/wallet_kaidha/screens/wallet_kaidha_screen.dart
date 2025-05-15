import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/mobile/appBar_mobile.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/features/wallet_kaidha/widgets/available_balance.dart';
import 'package:shella_design/features/wallet_kaidha/widgets/payment_details.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../../../common/widgets/texts/text_button.dart';

class WalletKaidhaScreen extends StatelessWidget {
  const WalletKaidhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: custom_AppBar(context, 'محفظة قيدها', Icons.arrow_back_sharp, Icons.account_balance_wallet_outlined),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PaymentDetails(),
              SizedBox(
                height: 20.h,
              ),
              PaymentOptions(),
              SizedBox(
                height: 20.h,
              ),

              // another amount
              Text(
                'مبلغ آخر',
                style: font13Black400W(context),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                labelText: '',
                padding: 0,
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SAR',
                      style: font14Green400W(context),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                borderColor: AppColors.greenColor,
              ),
              SizedBox(
                height: 20.h,
              ),

              // payment button
              TextButtonWidget(
                onPressed: () {},
                text: 'الدفع الآن',
                backgroundColor: AppColors.secondaryColor,
                textStyle: font13White400W(context),
                height: 60.h,
                width: double.infinity,
                radius: 16,
                verticalPadd: 0,
                horizontalPadd: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
