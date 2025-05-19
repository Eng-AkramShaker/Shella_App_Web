import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/Favorite/domain/models/store_model.dart';
import 'package:shella_design/features/Favorite/screens/mobile/store_favorite_card.dart';

class StoresTabView extends StatelessWidget {
  final List<Store> stores;
  final Future<void> Function() onRefresh;

  const StoresTabView({
    super.key,
    required this.stores,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (stores.isEmpty) {
      return const Center(
        child: Text(
          "لا توجد متاجر في المفضلة",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: ListView.builder(
          itemCount: stores.length,
          itemBuilder: (context, index) {
            return StoreFavoriteCard(store: stores[index]);
          },
        ),
      ),
    );
  }
}
