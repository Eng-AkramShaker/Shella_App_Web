import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import '../../../../../features/help_and_support/screens/web/help_and_support_web.dart';
import '../../../../../features/my_coupon/screens/web/my_coupon_web.dart';
import '../../../../../features/profile_detailes/controllers/profile_detailes_controller.dart';
import '../accountInformationColumn1/account_information_column1.dart';

class AccountContentArea extends StatelessWidget {
  final ProfileController controller;
  const AccountContentArea({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (controller.currentPage) {
      // case 0:
      //   content = AccountInformationData(
      //     username: 'نورا احمد',
      //     onPressed: () {},
      //     fhonenum: '0096266544884',
      //     dateofbirth: '12/12/1990',
      //     email: 'Mailto@mailto.com',
      //     password: 'test password',
      //   );
      //   break;
      // case 1:
      //   content = SavedaddressesData(
      //     address: 'السعودية، الرياض 55552333',
      //     onPressed1: () {},
      //     onPressed2: () {},
      //   );
      //   break;
      // case 2:
      //   content = const YourFavorites();
      //   break;
      // case 3:
      //   content = const MyStatistics();
      //   break;
      // case 4:
      //   content = const MyWallet();
      //   break;
      // case 5:
      //   content = const MahfazatQayduha();
      //   break;
      // case 6:
      //   content = const MyPointsWebWidget();
      //   break;
      case 7:
        content = const MyCouponWeb();
        break;
      // case 8:
      //   content = const RefundPolicy();
      //   break;
      // case 9:
      //   content = const PrivacyPolicy();
      //   break;
      // case 10:
      //   content = const ShurutQaydiha();
      //   break;
      // case 11:
      //   content = const TermsAndConditions();
      //   break;
      case 12:
        content = const HelpAndSupport();
        break;
      default:
        content = const SizedBox();
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(width(context, 1)>600||controller.currentPage==0)
        const AccountInformationColumn1(),
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: content,
        ),
      ],
    );
  }
}