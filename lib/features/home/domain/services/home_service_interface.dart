import 'package:shella_design/features/home/domain/models/popular_stores_model.dart';
import '../models/home_banners_model.dart';
import '../models/home_categories_model.dart';
import '../models/stores_model.dart';

abstract class HomeServiceInterface {

  Future<List<HomeCategoriesModel>> getHomeCategories();
  Future<HomeBannersModel> getHomeBanners();
  Future<PopularStoresModel> getPopularStores({String? type});
  Future<StoresModel> getStores({String? featured});
}