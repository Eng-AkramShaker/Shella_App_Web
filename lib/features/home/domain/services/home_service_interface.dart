import '../models/home_banners_model.dart';
import '../models/home_categories_model.dart';

abstract class HomeServiceInterface {

  Future<List<HomeCategoriesModel>> getHomeCategories();
  Future<HomeBannersModel> getHomeBanners();
}