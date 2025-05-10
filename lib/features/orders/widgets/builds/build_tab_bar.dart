import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_styles.dart';

Widget buildTabBar(TabController _tabController , BuildContext context) {
  return Card(
    color: AppColors.wtColor,
    child: TabBar(
      controller: _tabController,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0, color: AppColors.primaryColor),
        insets: EdgeInsets.symmetric(horizontal: 110.w),
      ),
      tabs: [
        _tabItem("معلومات المرسل", context),
        _tabItem("معلومات المتلقي", context),
      ],
    ),
  );
}

Widget _tabItem(String title , BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Custom_Text(context, text: title, style: font14Black500W(context)),
  );
}
