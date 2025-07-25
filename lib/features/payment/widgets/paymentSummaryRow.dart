import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget PaymentSummaryRow(
  String title,
  String value, {
  String? extra,
  bool isBold = false,
  required BuildContext context,
}) {
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
            Custom_Text(
              context,
              text: "(5 عناصر)",
              style: font14Grey400W(context),
            ),
          ],
        ],
      ),
    ],
  );
}
