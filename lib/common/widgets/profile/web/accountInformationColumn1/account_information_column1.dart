// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../features/profile_detailes/controllers/profile_detailes_controller.dart';
import '../../../../helper/app_routes.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_navigators.dart' as NavigationHelper;
import '../../../../util/app_styles.dart';
import '../../../texts/coustom_Text_Button.dart';

class AccountInformationColumn1 extends StatefulWidget {
  const AccountInformationColumn1({
    super.key,
  });

  @override
  State<AccountInformationColumn1> createState() => _AccountInformationColumn1State();
}

class _AccountInformationColumn1State extends State<AccountInformationColumn1> {
  List<String> title = [
    "معلومات الحساب",
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
    "المساعدة والدعم",
    "تسجيل الخروج",
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileController>(context);
    return Expanded(
      child: SizedBox(
        height: 1200,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: AppColors.gryColor_3,
                width: 2.0,
              )),
          color: AppColors.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Consumer<ProfileController>(
              builder: (context, controller, child) => ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        child: Custom_Text_Button(context,
                            borderRadius: 10,
                            backgroundColor:
                                index == controller.currentPage ? Color.fromARGB(255, 229, 246, 238) : AppColors.backgroundColor,
                            text: title[index], onPressed: () {
                          if (title[index] == "تسجيل الخروج") {
                            NavigationHelper.removeAllNavigation(context, AppRoutes.loginPage);
                            return;
                          }
                          controller.changePage(index);
                        },
                            text_style: index == controller.currentPage
                                ? font13Green500W(context, size: 24)
                                : font10Black400W(context, size: 24)),
                      ),
                      SizedBox(height: 15)
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
