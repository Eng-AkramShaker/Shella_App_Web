import 'package:flutter/material.dart';
import 'package:shella_design/features/home/controllers/banner_controller.dart';
import 'package:shella_design/features/home/controllers/section_controller.dart';
import 'package:shella_design/features/home/controllers/store_controller.dart';
import 'package:shella_design/features/home/domain/repositories/home_repository.dart';
import 'package:shella_design/features/home/domain/services/banner_service.dart';
import 'package:shella_design/features/home/domain/services/section_service.dart';
import 'package:shella_design/features/home/domain/services/store_service.dart';

class HomeController extends ChangeNotifier {
  final HomeRepository _repository;

  late final BannerProvider bannerProvider;
  late final SectionProvider categoryProvider;
  late final StoreProvider storeProvider;

  HomeController()
      : _repository = HomeRepository(
          bannerService: BannerService(),
          sectionService: SectionService(),
          storeService: StoreService(),
        ) {
    bannerProvider = BannerProvider(_repository);
    categoryProvider = SectionProvider(_repository);
    storeProvider = StoreProvider(_repository);
  }

  Future<void> loadInitialData() async {
    await Future.wait([
      bannerProvider.loadBanners(),
      categoryProvider.fetchCategories(),
      storeProvider.fetchStores(),
    ]);
  }
}
