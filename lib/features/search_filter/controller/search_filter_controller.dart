import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import 'package:shella_design/features/search_filter/domain/models/searchResultModel/search_result_model.dart';
import 'package:shella_design/features/search_filter/domain/services/searchServiceInterface/search_service_interface.dart';
import '../../../common/helper/check_Logged.dart';
import '../domain/models/addressModel/address_model.dart';
import '../domain/models/cartProductsModel/cart_products_model.dart';
import '../domain/models/mostSearchedModel/most_searched_model.dart';

enum SearchState {initial,loading,success,error}

class SearchFilterController with ChangeNotifier {

  final SearchServiceInterface? searchServiceInterface;
  SearchFilterController({this.searchServiceInterface});

  static SearchFilterController get(context, {listen=true}) => Provider.of<SearchFilterController>(context,listen: listen);

  /// GET STATE
  SearchState _state = SearchState.initial;
  SearchState get state => _state;

  int selectedCategory = 0;
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

  /// CHECK HOVER
  bool isHover = false;
  int? containerIndex;
  checkHover(value,index){
    isHover = value;
    containerIndex = index;
    notifyListeners();
  }

  /// CHECK HOVER
  bool isHoverView = false;
  bool? isListViewIcon;
  checkHoverView(value,listView){
    isHoverView = value;
    isListViewIcon = listView;
    notifyListeners();
  }

  /// SET LIST VIEW
  bool isListView = false;
  setListView(value){
    isListView = value;
    notifyListeners();
  }

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

  /// MIXED ITEMS
  List<Map<String,String>> mixedList = [];
  mixedItems(){
    for(int i=0; i<searchResultModel!.items!.length; i++) {
      mixedList.add(
        {
          'name': searchResultModel!.items![i].name!,
          'img': searchResultModel!.items![i].imageFullUrl!,
        }
      );
    }
    for(int i=0; i<searchResultModel!.stores!.length; i++) {
      mixedList.add(
        {
          'name': searchResultModel!.stores![i].name!,
          'img': searchResultModel!.stores![i].logoFullUrl!,
        }
      );
    }
    mixedList.shuffle();
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
      mixedItems();
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
      mostSearchedModel = await searchServiceInterface!.mostSearched();
      _state = SearchState.success;
      notifyListeners();
    }catch(e){
      _state = SearchState.error;
      notifyListeners();
    }
  }

  /// GET ADDRESS
  AddressModel? addressModel;
  getAddress() async {
    try{
      addressModel = await searchServiceInterface!.getAddress();
      notifyListeners();
    }catch(e){
      _state = SearchState.error;
      notifyListeners();
    }
  }

  /// CART PRODUCTS
  CartProductsModel? cartProductsModel;
  cartProducts() async {
    try{
      _state = SearchState.loading;
      notifyListeners();
      cartProductsModel = await searchServiceInterface!.cartProducts();
      _state = SearchState.success;
      notifyListeners();
    }catch(e){
      _state = SearchState.error;
      notifyListeners();
    }
  }

}
