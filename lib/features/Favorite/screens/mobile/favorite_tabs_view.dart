import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/Favorite/controllers/discount_controller.dart';
import 'package:shella_design/features/Favorite/screens/mobile/favorite_error_view.dart';
import 'package:shella_design/features/Favorite/screens/mobile/items_tab_view.dart';
import 'package:shella_design/features/Favorite/screens/mobile/stores_tab_view.dart';

class FavoriteTabsView extends StatelessWidget {
  final TabController tabController;
  final bool isRetrying;
  final Future<void> Function() onRefresh;
  final VoidCallback onRelogin;

  const FavoriteTabsView({
    super.key,
    required this.tabController,
    required this.isRetrying,
    required this.onRefresh,
    required this.onRelogin,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteController>(
      builder: (context, favoriteController, child) {
        if (favoriteController.isLoading || isRetrying) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.green));
        }

        if (favoriteController.errorMessage != null) {
          return FavoriteErrorView(
            errorMessage: favoriteController.errorMessage!,
            isRetrying: isRetrying,
            onRetry: onRefresh,
            onRelogin: onRelogin,
          );
        }

        return TabBarView(
          controller: tabController,
          children: [
            ItemsTabView(
              items: favoriteController.favoriteModel.wishItemList,
              onRefresh: onRefresh,
            ),
            StoresTabView(
              stores: favoriteController.favoriteModel.wishStoreList,
              onRefresh: onRefresh,
            ),
          ],
        );
      },
    );
  }
}