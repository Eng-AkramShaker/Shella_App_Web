import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shella_design/features/search_filter/domain/models/searchResultModel/search_result_model.dart';
import 'package:shella_design/features/search_filter/domain/repositories/searchRepositoryInterface/search_repository_interface.dart';
import 'package:shella_design/features/search_filter/domain/services/searchServiceInterface/search_service_interface.dart';
import '../../models/addressModel/address_model.dart';
import '../../models/allCategoriesModel/all_categories_model.dart';
import '../../models/cartProductsModel/cart_products_model.dart';
import '../../models/mostSearchedModel/most_searched_model.dart';

class SearchService implements SearchServiceInterface{

  final SearchRepositoryInterface searchRepositoryInterface;

  SearchService({required this.searchRepositoryInterface});

  ///-------------------------------------<<<---SEARCH ITEMS--->>>-------------------------------------
  @override
  Future<SearchResultModel> searchItems({value}) async {
    try{
      Response? response = await searchRepositoryInterface.searchItems(value: value);
      if(response!.statusCode==200){
        return SearchResultModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Search Item Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Search Item Exception :: ${e.toString()}');
      }
      throw Exception('Search Item Exception :: ${e.toString()}');
    }
  }

  ///-------------------------------------<<<---MOST SEARCHED--->>>-------------------------------------
  @override
  Future<MostSearchedModel> mostSearched() async {
    try{
      Response? response = await searchRepositoryInterface.mostSearched();
      if(response!.statusCode==200){
        return MostSearchedModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Most Searched Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Most Searched Exception :: ${e.toString()}');
      }
      throw Exception('Most Searched Exception :: ${e.toString()}');
    }
  }

  ///-------------------------------------<<<---CART PRODUCTS--->>>-------------------------------------
  @override
  Future<CartProductsModel> cartProducts() async {
    try{
      Response? response = await searchRepositoryInterface.cartProducts();
      if(response!.statusCode==200){
        return CartProductsModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Cart Products Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Cart Products Exception :: ${e.toString()}');
      }
      throw Exception('Cart Products Exception :: ${e.toString()}');
    }
  }

  ///-------------------------------------<<<---GET ADDRESS--->>>-------------------------------------
  @override
  Future<AddressModel> getAddress() async {
    try{
      Response? response = await searchRepositoryInterface.getAddress();
      if(response!.statusCode==200){
        return AddressModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Get Address Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Get Address Exception :: ${e.toString()}');
      }
      throw Exception('Get Address Exception :: ${e.toString()}');
    }
  }

  ///-------------------------------------<<<---GET ALL CATEGORIES--->>>-------------------------------------
  @override
  Future<List<AllCategoriesModel>> getAllCategories() async {
    try{
      Response? response = await searchRepositoryInterface.getAllCategories();
      if(response!.statusCode==200){
        return (jsonDecode(response.body) as List).map((e) => AllCategoriesModel.fromJson(e)).toList();
      }else{
        throw Exception('Get All Categories Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Get All Categories Exception :: ${e.toString()}');
      }
      throw Exception('Get All Categories Exception :: ${e.toString()}');
    }
  }
}