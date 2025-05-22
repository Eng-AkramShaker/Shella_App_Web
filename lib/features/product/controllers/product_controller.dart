import 'package:flutter/material.dart';
import 'package:shella_design/features/product/controllers/carfor.dart';
import 'package:shella_design/features/product/domain/services/carfor.dart';

class ProductController extends ChangeNotifier {
  late final FoodCategoryProvider foodCategoryProvider;

  ProductController() {
    foodCategoryProvider = FoodCategoryProvider(FoodCategoryService());
  }

  Future<void> loadAllProductData() async {
    await foodCategoryProvider.fetchMoreCategories();
  }
}
