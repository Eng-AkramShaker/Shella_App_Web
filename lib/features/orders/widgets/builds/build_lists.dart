import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/widgets/builds/build_list_view.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/lists.dart';

Widget buildLists(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h),
        Custom_Text(context, text: "مطاعم", style: font14Black600W(context)),
        buildListView(items: orders),
        Custom_Text(
          context,
          text: "سوبر ماركت",
          style: font14Black600W(context),
        ),
        buildListView(items: market),
      ],
    ),
  );
}
