import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../footerLinks/footer_links.dart';
import '../footerLogoSection/footer_logo_section.dart';

class FooterMainContent extends StatelessWidget {
  final bool isMobile;
  final bool isTab;

  const FooterMainContent({super.key, required this.isMobile, required this.isTab});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, List<String>>> linkData = [
      {"الشركة": ["عن شلة", "الوظائف", "الأسئلة وأجوبة", "الشريعة الإسلامية"]},
      {"القانونية": ["شروط قيدها", "سياسة الخصوصية", "الشروط والاحكام", "الإبلاغ عن المخالفات"]},
      {"التطبيق": ["الإنضمام كعامل توصيل", "الإنضمام كشريك تاجر", "الإنضمام كمندوب خدمة", "الإنضمام كمستثمر معنا"]},
      {"خدمة العملاء": ["قرارات العملاء", "تواصل معنا"]},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 0),
      child: isMobile?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FooterLogoSection(),
          SizedBox(height: 20.h),
          ...linkData.map((map) => FooterLinks(title: map.keys.first, items: map.values.first)),
        ],
      ):
      SizedBox(
        // height: isTab ? 200.h : 160.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FooterLogoSection(),
            ...linkData.map((map) => FooterLinks(title: map.keys.first, items: map.values.first)),
          ],
        ),
      ),
    );
  }
}