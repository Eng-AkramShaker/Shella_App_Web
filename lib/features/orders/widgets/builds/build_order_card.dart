import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/widgets/builds/build_order_buttons.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildOrderCard(Map<String, dynamic> order, BuildContext context) {
  return Card(
    color: AppColors.wtColor,
    child: SizedBox(
      height: 66.h,
      width: width_media(context),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: custom_Images_asset(
              image: order["logo"],
              h: height_media(context),
              fit: BoxFit.fitHeight,
              w: 65.w,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Custom_Text(
                  context,
                  text: order["name"],
                  style: font12Black400W(context),
                ),
                Custom_Text(
                  context,
                  text: order["date"],
                  style: font11Grey400W(context),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: buildOrderButtons(context),
          ),
        ],
      ),
    ),
  );
}
