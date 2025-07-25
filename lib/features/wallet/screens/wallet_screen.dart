import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/appBar/mobile/appBar_mobile.dart';
import 'package:shella_design/features/wallet/widgets/balance_container_widget.dart';
import 'package:shella_design/features/wallet/widgets/wallet_transactions_widgets.dart';
import 'package:shella_design/common/util/app_colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: custom_AppBar(
        context,
        title: 'المحفظة',
        icon: Icons.arrow_back_sharp,
        img_icon: AppImages.wallet,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            children: [
              BalanceContainerWidget(),
              SizedBox(
                height: 16.h,
              ),
              WalletTransactionsWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
