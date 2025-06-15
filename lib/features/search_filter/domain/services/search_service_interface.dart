import 'package:shella_design/features/search_filter/domain/models/searchResultModel/search_result_model.dart';
import '../models/addressModel/address_model.dart';
import '../models/allCategoriesModel/all_categories_model.dart';
import '../models/cartProductsModel/cart_products_model.dart';
import '../models/mostSearchedModel/most_searched_model.dart';

abstract class SearchServiceInterface {

  Future<SearchResultModel> searchItems({value});

  Future<MostSearchedModel> mostSearched();

  Future<CartProductsModel> cartProducts();

  Future<AddressModel> getAddress();

  Future<List<AllCategoriesModel>> getAllCategories();

}