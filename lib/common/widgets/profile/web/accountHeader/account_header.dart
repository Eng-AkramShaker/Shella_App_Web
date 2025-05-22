import 'package:flutter/material.dart';
import '../../../../../features/profile_detailes/controllers/profile_detailes_controller.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_navigators.dart' as NavigationHelper;
import '../../../../util/app_styles.dart';
import '../../../buttons/icon_button_circle.dart';
import '../../../texts/custom_text.dart';

class AccountHeader extends StatelessWidget {
  final ProfileController controller;
  const AccountHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButtonCircle(
          color: AppColors.greenColor,
          iconcolor: AppColors.backgroundColor,
          onPressed: () {
            controller.currentAddressesPage == 0? NavigationHelper.popRoute(context): controller.setCurrentAddressesPage(0);
            controller.changeAddressesPage();
          },
          icon: Icons.arrow_back_ios_new_rounded,
        ),
        const Spacer(flex: 1),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_Text(
              context,
              text: _getMainTitle(controller.currentPage),
              textAlign: TextAlign.center,
              style: font10Black600W(context, size: 25),
            ),
            const SizedBox(width: 10),
            Custom_Text(
              context,
              text: _getSecondaryTitle(controller.currentPage),
              style: font12Green600W(context, size: 25),
            )
          ],
        ),
        const Spacer(flex: 1),
      ],
    );
  }

  String _getMainTitle(int page) {
    return [
      "تفاصيل الحساب",
      "العناوين المحفوظة",
      "المفضلة لديك",
      "إحصائياتي",
      "محفظتي",
      "محفظة قيدها",
      "نقاطي",
      "قسائمي",
      "سياسة",
      "سياسة",
      "الشروط",
      "الشروط و",
      "المساعدة والدعم"
    ][page];
  }

  String _getSecondaryTitle(int page) {
    return [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "الاسترداد",
      "الخصوصية",
      "قيدها",
      "الأحكام",
      ""
    ][page];
  }
}
