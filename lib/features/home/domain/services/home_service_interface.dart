import '../models/home_categories_model.dart';

abstract class HomeServiceInterface {

  Future<List<HomeCategoriesModel>> getHomeCategories();
}