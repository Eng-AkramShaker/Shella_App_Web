import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class CustomerServiceButton extends StatelessWidget {
  final Function() onPressed;
  const CustomerServiceButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.gryColor_3, width: 1),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            custom_Images_asset(
              image: AppImages.customerservice,
              h: 30,
              w: 30,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(
                  context,
                  text: "خدمة العملاء 24/7 >",
                  style: font10Black600W(context, size: size_10(context)),
                ),
                Custom_Text(
                  context,
                  text: "سهولة وصول وسرعة استجابة",
                  style: font10Grey400W(context, size: size_12(context)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
