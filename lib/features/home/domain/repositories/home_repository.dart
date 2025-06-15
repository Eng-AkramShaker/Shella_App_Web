import 'package:shella_design/features/home/domain/models/banner_model.dart';
import 'package:shella_design/features/home/domain/models/section_model.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';
import 'package:shella_design/features/home/domain/services/banner_service.dart';
import 'package:shella_design/features/home/domain/services/section_service.dart';
import 'package:shella_design/features/home/domain/services/store_service.dart';

class HomeRepository {
  final BannerService _bannerService;
  final SectionService _sectionService;
  final StoreService _storeService;

  HomeRepository({
    required BannerService bannerService,
    required SectionService sectionService,
    required StoreService storeService,
  })  : _bannerService = bannerService,
        _sectionService = sectionService,
        _storeService = storeService;

  Future<List<BannerModel>> getBanners() async {
    return await _bannerService.fetchBanners();
  }

  Future<List<SectionModel>> getCategories() async {
    return await _sectionService.fetchCategories();
  }

  Future<List<StoreModel>> getStores({int offset = 1, int limit = 50}) async {
    return await _storeService.fetchStores(offset: offset, limit: limit);
  }
}
