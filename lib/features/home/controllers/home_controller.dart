import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/home/domain/services/home_service_interface.dart';
import '../domain/models/home_banners_model.dart';
import '../domain/models/home_categories_model.dart';

enum HomeState {initial,loading,success,error}

class HomeController with ChangeNotifier {

  final HomeServiceInterface homeServiceInterface;
  HomeController(this.homeServiceInterface);

  static HomeController get(context, {listen=true}) => Provider.of<HomeController>(context,listen: listen);

  /// GET STATE
  HomeState _state = HomeState.initial;
  HomeState get state => _state;

  /// CHANGE BANNER
  bool isChanged = false;
  changeBanner(value){
    isChanged = value;
    notifyListeners();
  }

  ///-------------------------------------<<<---APIs--->>>-------------------------------------

  /// GET HOME CATEGORIES
  List<HomeCategoriesModel>? homeCategoriesModel;
  getHomeCategories() async {
    try{
      _state = HomeState.loading;
      homeCategoriesModel=null;
      notifyListeners();
      homeCategoriesModel = await homeServiceInterface.getHomeCategories();
      _state = HomeState.success;
      notifyListeners();
    }catch(e){
      _state = HomeState.error;
      notifyListeners();
    }
  }

  /// GET HOME BANNERS
  HomeBannersModel? homeBannersModel;
  getHomeBanners() async {
    try{
      _state = HomeState.loading;
      homeBannersModel=null;
      notifyListeners();
      homeBannersModel = await homeServiceInterface.getHomeBanners();
      _state = HomeState.success;
      notifyListeners();
    }catch(e){
      _state = HomeState.error;
      notifyListeners();
    }
  }

}