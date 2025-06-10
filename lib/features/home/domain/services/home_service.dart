import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shella_design/features/home/domain/models/home_banners_model.dart';
import 'package:shella_design/features/home/domain/repositories/home_repository_interface.dart';
import 'package:shella_design/features/home/domain/services/home_service_interface.dart';
import '../models/home_categories_model.dart';

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

}
