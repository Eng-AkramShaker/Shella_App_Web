import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/home/domain/services/home_service_interface.dart';
import '../../../common/helper/check_Logged.dart';
import '../domain/models/home_banners_model.dart';
import '../domain/models/home_categories_model.dart';
import '../domain/models/popular_stores_model.dart';
import '../domain/models/stores_model.dart';
import '../domain/models/zones_model.dart';

enum HomeState {initial,loading,success,error}

class HomeController with ChangeNotifier {

  final HomeServiceInterface homeServiceInterface;
  HomeController(this.homeServiceInterface);

  static HomeController get(context, {listen=true}) => Provider.of<HomeController>(context,listen: listen);

  /// GET STATE
  HomeState _categoryState = HomeState.initial;
  HomeState _bannerState = HomeState.initial;
  HomeState _popularState = HomeState.initial;
  HomeState _storesState = HomeState.initial;
  HomeState get categoryState => _categoryState;
  HomeState get bannerState => _bannerState;
  HomeState get popularState => _popularState;
  HomeState get storesState => _storesState;

  /// CHANGE BANNER
  bool isChanged = false;
  changeBanner(value){
    isChanged = value;
    notifyListeners();
  }

  /// SELECT CATEGORY
  int categoryIndex = 0;
  selectCategory(index){
    categoryIndex = index;
    notifyListeners();
  }

  /// CHECK IS FOOD
  bool isFood(){
    return homeCategoriesModel![categoryIndex].moduleType=='food';
  }

  ///-------------------------------------<<<---APIs--->>>-------------------------------------

  /// GET ZONES
  List<ZonesModel>? zonesModel;
  getZones() async {
    try{
      customPrint('IN ZONES');
      zonesModel=null;
      notifyListeners();
      zonesModel = await homeServiceInterface.getZones();
      List zones = zonesModel?.map((e) => e.id).toList() ?? [];
      sp<SharedPreferences>().setString(SharedPrefKeys.zones, jsonEncode(zones));
      notifyListeners();
    }catch(e){
      notifyListeners();
    }
  }

  /// GET HOME CATEGORIES
  List<HomeCategoriesModel>? homeCategoriesModel;
  getHomeCategories() async {
    try{
      _categoryState = HomeState.loading;
      homeCategoriesModel=null;
      notifyListeners();
      homeCategoriesModel = await homeServiceInterface.getHomeCategories();
      getPopularStores(type: homeCategoriesModel!.first.moduleType,moduleId: homeCategoriesModel!.first.id.toString());
      getStores(moduleId: homeCategoriesModel!.first.id.toString());
      _categoryState = HomeState.success;
      notifyListeners();
    }catch(e){
      _categoryState = HomeState.error;
      notifyListeners();
    }
  }

  /// GET HOME BANNERS
  HomeBannersModel? homeBannersModel;
  getHomeBanners() async {
    try{
      _bannerState = HomeState.loading;
      homeBannersModel=null;
      notifyListeners();
      homeBannersModel = await homeServiceInterface.getHomeBanners();
      _bannerState = HomeState.success;
      notifyListeners();
    }catch(e){
      _bannerState = HomeState.error;
      notifyListeners();
    }
  }

  /// GET POPULAR STORES
  PopularStoresModel? popularStoresModel;
  getPopularStores({String? type,String? moduleId}) async {
    try{
      _popularState = HomeState.loading;
      popularStoresModel=null;
      notifyListeners();
      popularStoresModel = await homeServiceInterface.getPopularStores(type: type,moduleId: moduleId);
      _popularState = HomeState.success;
      notifyListeners();
    }catch(e){
      _popularState = HomeState.error;
      notifyListeners();
    }
  }

  /// GET STORES
  StoresModel? storesModel;
  getStores({String? moduleId}) async {
    try{
      _storesState = HomeState.loading;
      popularStoresModel=null;
      notifyListeners();
      storesModel = await homeServiceInterface.getStores(moduleId: moduleId);
      _storesState = HomeState.success;
      notifyListeners();
    }catch(e){
      _storesState = HomeState.error;
      notifyListeners();
    }
  }

}