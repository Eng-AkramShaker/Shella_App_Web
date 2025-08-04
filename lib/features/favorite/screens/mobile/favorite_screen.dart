// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/features/favorite/controllers/favorite_controller.dart';
import 'package:shella_design/features/favorite/widget/mobile/favorite_page_app_bar.dart';
import 'package:shella_design/features/restaurant/widgets/mobile/item_of_restaurant.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Favorite_Controller>(context, listen: false).getFavourite();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Favorite_Controller>(
      builder: (context, favoriteController, _) {
        final favoriteItems = favoriteController.List_favourite.item;
        final favoriteStore = favoriteController.List_favourite.store;

        return Scaffold(
          appBar: favoritePageAppBar(context, controller: _tabController),
          body: TabBarView(
            controller: _tabController,
            children: [
              // المنتجات
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    favoriteItems.isEmpty
                        ? const Center(child: Text("لا يوجد منتجات مفضلة"))
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(favoriteItems.length, (index) {
                                final item = favoriteItems[index];

                                return Card(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.w, left: 3.w),
                                    child: ItemOfRestaurant(
                                      title: item.name ?? '',
                                      description: item.description ?? '',
                                      imageUrl: item.imageFullUrl ?? '',
                                      price: (item.price is num) ? item.price.toDouble() : 0.0,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                  ],
                ),
              ),

              // المتاجر
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      favoriteItems.isEmpty
                          ? const Center(child: Text("لا يوجد منتجات مفضلة"))
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(favoriteStore.length, (index) {
                                  final store = favoriteStore[index];

                                  return Card(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.w, left: 3.w),
                                      child: ItemOfRestaurant(
                                        title: store.name ?? '',
                                        description: store.description ?? '',
                                        imageUrl: store.imageFullUrl ?? '',
                                        price: (store.price is num) ? store.price.toDouble() : 0.0,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
