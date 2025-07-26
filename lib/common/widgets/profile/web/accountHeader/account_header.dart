import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import '../../../../../features/settings/controllers/profile_detailes_controller.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_styles.dart';
import '../../../buttons/icon_button_circle.dart';
import '../../../gap/width/width.dart';
import '../../../texts/custom_text.dart';

class AccountHeader extends StatelessWidget {
  final ProfileController controller;
  const AccountHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButtonCircle(
          color: AppColors.greenColor,
          iconcolor: AppColors.backgroundColor,
          onPressed: () {
            controller.currentAddressesPage == 0 ? nav.back() : controller.setCurrentAddressesPage(0);
            controller.changeAddressesPage();
          },
          icon: Icons.arrow_back_ios_new_rounded,
        ),
        (width(context, 1) > 600 || controller.currentPage == 0)
            ? const Spacer(flex: 1)
            : SizedBox(
                width: 20,
              ),
        Custom_Text(
          context,
          text: _getMainTitle(controller.currentPage),
          textAlign: TextAlign.center,
          style: font10Black600W(context, size: width(context, 1) > 600 ? 25 : 17),
        ),
        const Spacer(flex: 1),
        if (width(context, 1) < 600 && controller.currentPage != 0)
          SizedBox(
            width: width(context, 0.32),
            child: DropdownButton(
              hint: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Custom_Text(context, text: _getMainTitle(controller.currentPage), style: font10Black600W(context, size: 15)),
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              underline: const SizedBox(),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              alignment: Alignment.centerLeft,
              items: [
                DropdownMenuItem(
                  value: 0,
                  child: Custom_Text(context, text: 'تفاصيل الحساب', style: font10Black600W(context, size: 15)),
                ),
                DropdownMenuItem(
                    value: 1, child: Custom_Text(context, text: 'العناوين المحفوظة', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(
                    value: 2, child: Custom_Text(context, text: 'المفضلة لديك', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(value: 3, child: Custom_Text(context, text: 'إحصائياتي', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(value: 4, child: Custom_Text(context, text: 'محفظتي', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(
                    value: 5, child: Custom_Text(context, text: 'محفظة قيدها', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(value: 6, child: Custom_Text(context, text: 'نقاطي', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(value: 7, child: Custom_Text(context, text: 'قسائمي', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(
                    value: 8, child: Custom_Text(context, text: 'سياسة الاسترداد', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(
                    value: 9, child: Custom_Text(context, text: 'سياسة الخصوصية', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(
                    value: 10, child: Custom_Text(context, text: 'الشروط قيدها', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(
                    value: 11, child: Custom_Text(context, text: 'الشروط والأحكام', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(
                    value: 12, child: Custom_Text(context, text: 'المساعدة والدعم', style: font10Black600W(context, size: 15))),
                DropdownMenuItem(
                    value: 13, child: Custom_Text(context, text: 'تسجيل الخروج', style: font10Black600W(context, size: 15))),
              ],
              onChanged: (value) {
                controller.changePage(value!);
              },
              dropdownColor: AppColors.wtColor,
              // value:QuickTaskCubit.get(context).filterValue,
              isExpanded: true,
            ),
          ),
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
      "سياسة الاسترداد",
      "سياسة الخصوصية",
      "الشروط قيدها",
      "الشروط والأحكام",
      "المساعدة والدعم"
    ][page];
  }
}
