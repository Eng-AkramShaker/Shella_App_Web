import 'package:flutter/material.dart';
import 'package:shella_design/features/home/controllers/banner_controller.dart';
import 'package:shella_design/features/home/controllers/category_controller.dart';
import 'package:shella_design/features/home/controllers/store_controller.dart';
import 'package:shella_design/features/home/domain/services/banner_service.dart';
import 'package:shella_design/features/home/domain/services/category_service.dart';
import 'package:shella_design/features/home/domain/services/store_service.dart';

class HomeController extends ChangeNotifier {
  late final BannerProvider bannerProvider;
  late final CategoryProvider categoryProvider;
  late final StoreProvider storeProvider;

  HomeController() {
    bannerProvider = BannerProvider(BannerService());
    categoryProvider = CategoryProvider(CategoryService());
    storeProvider = StoreProvider(StoreService());
  }

  Future<void> loadInitialData() async {
    await Future.wait([
      bannerProvider.loadBanners(),
      categoryProvider.fetchCategories(),
      storeProvider.fetchStores(),
    ]);
  }
}
