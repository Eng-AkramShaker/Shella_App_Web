import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shella_design/features/home/domain/models/home_banners_model.dart';
import 'package:shella_design/features/home/domain/repositories/home_repository_interface.dart';
import 'package:shella_design/features/home/domain/services/home_service_interface.dart';
import '../models/home_categories_model.dart';
import '../models/popular_stores_model.dart';
import '../models/stores_model.dart';
import '../models/zones_model.dart';

class HomeService extends HomeServiceInterface {

  final HomeRepositoryInterface homeRepositoryInterface;
  HomeService(this.homeRepositoryInterface);

  ///-------------------------------------<<<---GET HOME CATEGORIES--->>>-------------------------------------
  @override
  Future<List<HomeCategoriesModel>> getHomeCategories() async {
    try{
      Response? response = await homeRepositoryInterface.getHomeCategories();
      if(response!.statusCode==200){
        return (jsonDecode(response.body) as List).map((e) => HomeCategoriesModel.fromJson(e)).toList();
      }else{
        throw Exception('Get Home Categories Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Get Home Categories Exception :: ${e.toString()}');
      }
      throw Exception('Get Home Categories Exception :: ${e.toString()}');
    }
  }

  ///-------------------------------------<<<---GET HOME BANNERS--->>>-------------------------------------
  @override
  Future<HomeBannersModel> getHomeBanners() async {
    try{
      Response? response = await homeRepositoryInterface.getHomeBanners();
      if(response!.statusCode==200){
        return HomeBannersModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Get Home Banners Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Get Home Banners Exception :: ${e.toString()}');
      }
      throw Exception('Get Home Banners Exception :: ${e.toString()}');
    }
  }

  ///-------------------------------------<<<---GET POPULAR STORES--->>>-------------------------------------
  @override
  Future<PopularStoresModel> getPopularStores({String? type,String? moduleId}) async {
    try{
      Response? response = await homeRepositoryInterface.getPopularStores(type: type,moduleId: moduleId);
      if(response!.statusCode==200){
        return PopularStoresModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Get Popular Stores Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Get Popular Stores Exception :: ${e.toString()}');
      }
      throw Exception('Get Popular Stores Exception :: ${e.toString()}');
    }
  }

  ///-------------------------------------<<<---GET STORES--->>>-------------------------------------
  @override
  Future<StoresModel> getStores({String? moduleId}) async {
    try{
      Response? response = await homeRepositoryInterface.getStores(moduleId: moduleId);
      if(response!.statusCode==200){
        return StoresModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Get Stores Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Get Stores Exception :: ${e.toString()}');
      }
      throw Exception('Get Stores Exception :: ${e.toString()}');
    }
  }

  ///-------------------------------------<<<---GET ZONES--->>>-------------------------------------
  @override
  Future<List<ZonesModel>> getZones({String? featured}) async {
    try{
      Response? response = await homeRepositoryInterface.getZones();
      if(response!.statusCode==200){
        return (jsonDecode(response.body) as List).map((e) => ZonesModel.fromJson(e)).toList();
      }else{
        throw Exception('Get Zones Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Get Zones Exception :: ${e.toString()}');
      }
      throw Exception('Get Zones Exception :: ${e.toString()}');
    }
  }

}
