import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/search_filter/domain/models/searchResultModel/search_result_model.dart';
import 'package:shella_design/features/search_filter/domain/services/searchServiceInterface/search_service_interface.dart';
import '../../../common/helper/check_Logged.dart';
import '../domain/models/cartProductsModel/cart_products_model.dart';
import '../domain/models/mostSearchedModel/most_searched_model.dart';

enum SearchState {initial,loading,success,error}

class SearchFilterController with ChangeNotifier {

  final SearchServiceInterface? searchServiceInterface;
  SearchFilterController({this.searchServiceInterface});

  static SearchFilterController get(context) => Provider.of<SearchFilterController>(context);

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

  /// GET SEARCH HISTORY
  List<String> _searchHistory = sp<SharedPreferences>().getStringList(SharedPrefKeys.searchHistory)??[];
  List<String> get searchHistory => _searchHistory;

  /// SAVE SEARCH HISTORY
  saveSearchHistory(value){
    _searchHistory.add(value);
    sp<SharedPreferences>().setStringList(SharedPrefKeys.searchHistory, _searchHistory);
    notifyListeners();
  }

  /// REMOVE SEARCH HISTORY ITEM
  removeSearchHistoryItem(index){
    _searchHistory = sp<SharedPreferences>().getStringList(SharedPrefKeys.searchHistory)??[];
    _searchHistory.removeAt(index);
    sp<SharedPreferences>().setStringList(SharedPrefKeys.searchHistory, _searchHistory);
    notifyListeners();
  }

  /// SET SEARCH VALUE
  var searchController = TextEditingController();
  setSearchValue({value,index}){
    searchController.text=value;
    searchItems(value: value);
    removeSearchHistoryItem(index);
    saveSearchHistory(value);
    notifyListeners();
  }

  ///-------------------------------------<<<---APIs--->>>-------------------------------------

  /// SEARCH ITEMS
  SearchResultModel? searchResultModel;
  searchItems({value}) async {
    try{
      _state = SearchState.loading;
      searchResultModel=null;
      notifyListeners();
      searchResultModel = await searchServiceInterface!.searchItems(value: value);
      _state = SearchState.success;
      notifyListeners();
    }catch(e){
      _state = SearchState.error;
      notifyListeners();
    }
  }

  /// MOST SEARCHED
  MostSearchedModel? mostSearchedModel;
  mostSearched() async {
    try{
      _state = SearchState.loading;
      notifyListeners();
      customPrint('SEARCH INTERFACE IN MOST SEARCHED ::: $searchServiceInterface');
      mostSearchedModel = await searchServiceInterface!.mostSearched();
      _state = SearchState.success;
      notifyListeners();
    }catch(e){
      _state = SearchState.error;
      notifyListeners();
    }
  }

  // /// CART PRODUCTS
  // CartProductsModel? cartProductsModel;
  // cartProducts() async {
  //   try{
  //     _state = SearchState.loading;
  //     notifyListeners();
  //     customPrint('SEARCH INTERFACE IN CART ::: $searchServiceInterface');
  //     cartProductsModel = await searchServiceInterface!.cartProducts();
  //     _state = SearchState.success;
  //     notifyListeners();
  //   }catch(e){
  //     _state = SearchState.error;
  //     notifyListeners();
  //   }
  // }

}
