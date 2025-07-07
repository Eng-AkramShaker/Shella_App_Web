import 'package:flutter/material.dart';
import 'package:shella_design/features/home/controllers/banner_controller.dart';
import 'package:shella_design/features/home/controllers/section_controller.dart';
import 'package:shella_design/features/home/controllers/store_controller.dart';
import 'package:shella_design/features/home/domain/services/banner_service.dart';
import 'package:shella_design/features/home/domain/services/section_service.dart';
import 'package:shella_design/features/home/domain/services/store_service.dart';

class HomeController extends ChangeNotifier {
  late final BannerProvider bannerProvider;
  late final SectionProvider categoryProvider;
  late final StoreProvider storeProvider;

  HomeController() {
    bannerProvider = BannerProvider(BannerService());
    categoryProvider = SectionProvider(SectionService());
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
