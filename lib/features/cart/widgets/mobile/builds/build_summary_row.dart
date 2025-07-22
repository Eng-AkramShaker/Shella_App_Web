import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildSummaryRow(String title, String value, BuildContext context,
    {String? extra, bool isBold = false}) {
  return Row(
    textDirection: TextDirection.ltr,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Custom_Text(context, text: value, style: font14Black400W(context)),
      Row(
        children: [
          Custom_Text(context, text: title, style: font14Black400W(context)),
          if (extra != null) ...[
            SizedBox(width: 7.w),
<<<<<<<< HEAD:lib/features/cart/widgets/mobile/builds/build_summary_row.dart
            Custom_Text(context, text: extra, style: font14Grey400W(context)),
========
            Custom_Text(context,
                text: "(5 عناصر)", style: font14Grey400W(context)),
>>>>>>>> 93e16ca64e991487f2431e7c68ebbd34043ca0f4:lib/features/cart/widgets/builds/mobile/build_summary_row.dart
          ],
        ],
      ),
    ],
  );
}
