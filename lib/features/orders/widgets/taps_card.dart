import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class TapsCard extends StatelessWidget {
  const TapsCard({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.wtColor,
      child: TabBar(
        controller: _tabController,
        dividerColor: Colors.transparent,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 3.0,
            color: AppColors.primaryColor,
          ),
          insets: EdgeInsets.symmetric(horizontal: 70),
        ),
        tabs: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Custom_Text(
              context,
              text: "فوري",
              style: font14Black600W(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Custom_Text(
              context,
              text: "مجدول",
              style: font14Black600W(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Custom_Text(
              context,
              text: "منتهي",
              style: font14Black600W(context),
            ),
          ),
        ],
      ),
    );
  }
}
