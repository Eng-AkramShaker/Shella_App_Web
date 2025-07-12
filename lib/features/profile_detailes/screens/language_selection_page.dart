import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

import 'package:shella_design/features/profile_detailes/widgets/languageOption.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  late bool isSelecedforArabic;
  late bool isSelectedForEnglish;
  @override
  Widget build(BuildContext context) {
    final _tempSelectedLanguageCode = context.locale.languageCode;
    if (_tempSelectedLanguageCode == 'ar') {
      isSelecedforArabic = true;
      isSelectedForEnglish = false;
    } else {
      isSelectedForEnglish = true;
      isSelecedforArabic = false;
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height / 20),
            Icon(Icons.translate, size: 80.r, color: Colors.orange),
            SizedBox(height: size.height / 20),
            Text(
              "select_language_prompt".tr(),
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height / 20),
            buildLanguageOption(
              onTap: () {
                context.setLocale(Locale('ar'));
                setState(() {
                  isSelecedforArabic = !isSelecedforArabic;
                  isSelectedForEnglish = !isSelectedForEnglish;
                });
              },
              title: 'العربية',
              subtitle: 'مرحباً، كيف يمكنني المساعدة؟',
              isSelected: isSelecedforArabic,
            ),
            SizedBox(height: 16),
            buildLanguageOption(
                onTap: () {
                  context.setLocale(Locale('en'));
                  setState(() {
                    isSelectedForEnglish = !isSelectedForEnglish;
                    isSelecedforArabic = !isSelecedforArabic;
                  });
                },
                title: 'English Language',
                subtitle: 'Hello, how can I help you?',
                isSelected: isSelectedForEnglish),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenColor,
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  )),
              child: Text(
                'save_button_text'.tr(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
