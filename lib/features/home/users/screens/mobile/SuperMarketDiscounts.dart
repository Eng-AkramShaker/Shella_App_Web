import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/lists.dart';
import 'package:shella_design/features/home/home/widgets/builds/DiscountAppBar.dart';
import 'package:shella_design/features/home/users/widgets/mobile/discount_items_widget.dart';

class SuperMarketDiscounts extends StatefulWidget {
  const SuperMarketDiscounts({super.key});

  @override
  _SuperMarketDiscountsState createState() => _SuperMarketDiscountsState();
}

class _SuperMarketDiscountsState extends State<SuperMarketDiscounts>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(137.0.h),
        child: DiscountAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Container(
          color: AppColors.backgroundColor,
          child: Column(
            children: [
              TabBar(
                  unselectedLabelStyle:
                      TextStyle(color: Colors.black, fontSize: 14.sp),
                  labelStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.green,
                  indicatorSize: TabBarIndicatorSize.label,
                  //    isScrollable: true,
                  tabs: discountsTypes
                      .map((title) => Tab(
                            text: title,
                          ))
                      .toList()),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 126,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(AppImages.storeOffer),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(child: DiscountItemsWidget()),
                    Center(child: DiscountItemsWidget()),
                    Center(child: DiscountItemsWidget()),
                    Center(child: DiscountItemsWidget()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
