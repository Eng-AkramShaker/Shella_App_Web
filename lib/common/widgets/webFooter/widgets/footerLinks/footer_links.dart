import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import '../../../../helper/app_routes.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_styles.dart';
import '../../../texts/custom_text.dart';

class FooterLinks extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterLinks({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(context, text: title, style: font12Green400W(context, size: 16)),
        SizedBox(height: 16.h),
        ...items.map(
          (item) => Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: InkWell(
              onTap: () {
                nav.push(AppRoutes.termsAndConditionsScreen);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 4,
                    height: 4.h,
                    color: AppColors.bgColor,
                  ),
                  SizedBox(width: 5),
                  Flexible(child: Custom_Text(context, text: item, style: font10Black400W(context, size: 14))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
