import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/Favorite/domain/models/item_model.dart';
import 'package:shella_design/features/Favorite/screens/mobile/item_favorite_card.dart';

class ItemsTabView extends StatelessWidget {
  final List<Item> items;
  final Future<void> Function() onRefresh;

  const ItemsTabView({
    super.key,
    required this.items,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          "لا توجد منتجات في المفضلة",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemFavoriteCard(item: items[index]);
          },
        ),
      ),
    );
  }
}