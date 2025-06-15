<<<<<<< HEAD
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
=======
import 'dart:convert';

import 'package:http/src/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../api/api_client.dart';
import '../../../../common/helper/check_Logged.dart';
import '../../../../common/util/Api_constants.dart';
import '../../../../common/widgets/print/custom_print.dart';
import 'home_repository_interface.dart';

class HomeRepository extends HomeRepositoryInterface {

  ///-------------------------------------<<<---GET HOME CATEGORIES--->>>-------------------------------------
  @override
  Future<Response?> getHomeCategories() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>(),zoneId: false).getData(Api_Constants.homeCategories);
    customPrint('Get Home Categories Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET HOME BANNERS--->>>-------------------------------------
  @override
  Future<Response?> getHomeBanners() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.homeBanners);
    customPrint('Get Home Banners Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET POPULAR STORES--->>>-------------------------------------
  @override
  Future<Response?> getPopularStores({String? type,String? moduleId}) async {
    customPrint('TYPE =====>> $type');
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>(),moduleId: moduleId).getData(Api_Constants.popularStores,query: {'type': type??'all'});
    customPrint('Get Popular Stores Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET STORES--->>>-------------------------------------
  @override
  Future<Response?> getStores({String? moduleId}) async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>(),moduleId: moduleId).getData(Api_Constants.getStores,query: {'featured': '1'});
    customPrint('Get Stores Response :: ${jsonDecode(response!.body)}');
    return response;
  }

  ///-------------------------------------<<<---GET ZONES--->>>-------------------------------------
  @override
  Future<Response?> getZones() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.zones);
    customPrint('Get Zones Response :: ${jsonDecode(response!.body)}');
    return response;
  }

}
>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2
