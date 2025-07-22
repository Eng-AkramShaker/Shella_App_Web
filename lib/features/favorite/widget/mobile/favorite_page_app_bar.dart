import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

PreferredSizeWidget? favoritePageAppBar(BuildContext context,
    {required TabController? controller}) {
  return AppBar(
    backgroundColor: Colors.green,
    title: Custom_Text(context,
        text: MainAppConstants.favorite, style: font14White600W(context)),
    centerTitle: true,
    bottom: TabBar(
      unselectedLabelStyle:
          TextStyle(color: AppColors.backgroundColor, fontSize: 14.sp),
      labelStyle: TextStyle(color: AppColors.backgroundColor, fontSize: 18.sp),
      controller: controller,
      labelColor: AppColors.backgroundColor,
      unselectedLabelColor: AppColors.backgroundColor,
      indicatorColor: Colors.green,
      tabs: [
        Tab(
          text: MainAppConstants.products,
        ),
        Tab(text: MainAppConstants.allStores),
      ],
    ),
  );
}
