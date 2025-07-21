import 'package:flutter/material.dart';

import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: AppColors.greenColor, size: 45),
          const SizedBox(height: 10),
          Custom_Text(context, text: "طلبك قيد المراجعة بمحفظة قيدها", style: font10Black600W(context, size: size_14(context))),
          const SizedBox(height: 15),
          Custom_Text(context,
              text: "شكرآ لك على ملئ البيانات المطلوبة\nسوف نتواصل معك قريبآ",
              textAlign: TextAlign.center,
              style: font10Grey500W(context, size: size_12(context))),
          const SizedBox(height: 15),
          custom_Button(
            h: 50,
            w: 300,
            context,
            title: "تم",
            style: font12White500W(context, size: size_12(context)),
            onPressed: () => nav.back(),
          )
        ],
      ),
    );
  }
}
