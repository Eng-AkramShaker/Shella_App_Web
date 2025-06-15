import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("المفضلة"),
        centerTitle: true,
        bottom: TabBar(
          unselectedLabelStyle: TextStyle(color: AppColors.backgroundColor, fontSize: 14.sp),
          labelStyle: TextStyle(color: AppColors.backgroundColor, fontSize: 18.sp),
          controller: _tabController,
          labelColor: AppColors.backgroundColor,
          unselectedLabelColor: AppColors.backgroundColor,
          indicatorColor: Colors.green,
          tabs: const [
            Tab(
              text: "المنتجات",
            ),
            Tab(text: "كل المتاجر"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text("قائمة المنتجات المفضلة")),
          Center(child: Text("قائمة المتاجر المفضلة")),
        ],
      ),
    );
  }
}
