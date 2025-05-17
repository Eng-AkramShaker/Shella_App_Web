import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/features/search_filter/domain/models/searchResultModel/search_result_model.dart';
import 'package:shella_design/features/search_filter/domain/services/searchServiceInterface/search_service_interface.dart';

enum SearchState {initial,loading,success,error}

class SearchFilterController with ChangeNotifier {

  final SearchServiceInterface? searchServiceInterface;
  SearchFilterController({this.searchServiceInterface});

  /// GET STATE
  SearchState _state = SearchState.initial;
  SearchState get state => _state;

  String selectedCategory = 'اصناف المتاجر';
  final List<String> previousSearches = ['عروض وخصومات', 'مشروبات', 'ماركت'];
  final List<String> img = [
    AppImages.item_42,
    AppImages.item_42,
    AppImages.item_42,
    AppImages.item_42,
    AppImages.item_42,
  ];
  final int cartNum = 5;
  final List<String> sites = [
    'موقع 1',
    'موقع 2',
    'موقع 3',
    'موقع 4',
  ];
  final List<String> text = [
    "عروض وتخفيضات",
    "متاجر جديدة",
    "مشروبات وقهوة",
    "المخبوزات",
    "شوكولا",
  ];

  ///-------------------------------------<<<---APIs--->>>-------------------------------------

  /// SEARCH ITEMS
  SearchResultModel? searchResultModel;
  searchItems({value}) async {
    try{
      _state = SearchState.loading;
      notifyListeners();
      searchResultModel = await searchServiceInterface!.searchItems(value: value);
      _state = SearchState.success;
      notifyListeners();
    }catch(e){
      _state = SearchState.error;
      notifyListeners();
    }
  }

}
