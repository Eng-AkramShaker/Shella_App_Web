import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/webFooter/widgets/footerBottomSection/footer_button_section.dart';
import 'package:shella_design/common/widgets/webFooter/widgets/footerMainContent/footer_main_content.dart';
import 'package:shella_design/common/widgets/webFooter/widgets/footerTopSection/footer_top_section.dart';
import '../../helper/responsive_helper.dart';
import '../../util/app_colors.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    final bool isTab = ResponsiveLayout.isTab(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: AppColors.gryColor_3),
        SizedBox(height: 5.h),
        FooterTopSection(isMobile: isMobile),
        const Divider(color: AppColors.gryColor_3),
        SizedBox(height: 20.h),
        FooterMainContent(isMobile: isMobile, isTab: isTab),
        SizedBox(height: 10),
        const Divider(color: AppColors.gryColor_3),
        SizedBox(height: 10.h),
        FooterBottomSection(isMobile: isMobile),
      ],
    );
  }
}
