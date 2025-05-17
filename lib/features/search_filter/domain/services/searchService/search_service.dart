import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shella_design/features/search_filter/domain/models/searchResultModel/search_result_model.dart';
import 'package:shella_design/features/search_filter/domain/repositories/searchRepositoryInterface/search_repository_interface.dart';
import 'package:shella_design/features/search_filter/domain/services/searchServiceInterface/search_service_interface.dart';

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
}