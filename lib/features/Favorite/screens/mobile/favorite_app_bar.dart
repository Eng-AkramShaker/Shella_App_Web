import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

class FavoriteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final VoidCallback? onRefresh;

  const FavoriteAppBar({
    super.key,
    required this.tabController,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(
        "المفضلة",
        style: TextStyle(color: AppColors.backgroundColor, fontSize: 18.sp),
      ),
      centerTitle: true,
      bottom: TabBar(
        unselectedLabelStyle:
            TextStyle(color: AppColors.backgroundColor, fontSize: 14.sp),
        labelStyle:
            TextStyle(color: AppColors.backgroundColor, fontSize: 18.sp),
        controller: tabController,
        labelColor: AppColors.backgroundColor,
        unselectedLabelColor: AppColors.backgroundColor,
        indicatorColor: Colors.white,
        tabs: const [
          Tab(text: "المنتجات"),
          Tab(text: "المتاجر"),
        ],
      ),
     
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 48.h);
}
