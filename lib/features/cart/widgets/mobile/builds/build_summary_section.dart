import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/divider/divider_2.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';

import 'build_summary_row.dart';

Widget buildSummarySection(
    BuildContext context, CartController cartController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        buildSummaryRow(
            "المجموع الفرعي", "${cartController.subtotal}", context),
        Cus_Divider(color: AppColors.gryColor_2),
        buildSummaryRow("الضرائب والرسوم", "${cartController.tax}", context),
        Cus_Divider(color: AppColors.gryColor_2),
        buildSummaryRow("التوصيل", "${cartController.delivery}", context),
        Cus_Divider(color: AppColors.gryColor_2),
        buildSummaryRow("الإجمالي", "${cartController.total}", context,
            extra: "عدد العناصر : ${cartController.cartItemCount}",
            isBold: true),
        SizedBox(height: 50.h),
      ],
    ),
  );
}
// 634.75
// 189.75
// 54.75
// 32.85
// 51.25
// 60
