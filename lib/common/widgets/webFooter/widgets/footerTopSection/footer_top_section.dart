import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_styles.dart';
import '../../../texts/custom_text.dart';
import '../footerStoreButtons/footer_store_buttons.dart';

class FooterTopSection extends StatelessWidget {
  final bool isMobile;
  const FooterTopSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 0),
      child: isMobile?
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_Text(context, text: 'حمل التطبيق ', color: AppColors.bgColor, size: 16.sp),
            SizedBox(height: 8.h),
            SizedBox(
              child: Custom_Text(context,
                text: 'احصل على كل ما تحتاجه من المطعام والسوبر ماركت والمزيد مع خدماتنا المميزة',
                size: 13.sp,
                color: AppColors.darkGreyColor,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 16.h),
            const FooterStoreButtons(),
          ],
        ),
      ):
      Row(
        children: [
          Custom_Text(context, text: 'حمل التطبيق ', style: font10Black400W(context, size: 20)),
          SizedBox(width: 10,),
          SizedBox(
            width: width(context, 0.5),
            child: Custom_Text(context,
              text: 'احصل على كل ما تحتاجه من المطعام والسوبر ماركت والمزيد مع خدماتنا المميزة',
              style: font10Grey700W(context, size: 12),
              textAlign: TextAlign.start,
            ),
          ),
          Spacer(),
          const FooterStoreButtons(),
        ],
      ),
    );
  }
}