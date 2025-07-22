// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/appBar/mobile/appBar_mobile.dart';

class Kiadha_WalletScreen extends StatelessWidget {
  const Kiadha_WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isLoggedIn = AuthHelper.isLoggedIn();

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: custom_AppBar(
        context,
        title: 'kiadha_wallet'.tr(),
        img_icon: AppImages.walletIcon,
        titleIcon: Icons.account_balance_wallet_outlined,
      ),
      // body: NotLoggedInScreen(callBack: (value) {}),
    );
  }
}
