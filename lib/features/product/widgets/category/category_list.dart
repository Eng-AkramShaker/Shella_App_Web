import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/product/controllers/product_controller.dart';
import 'category_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_images.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late final ProductController _productController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _productController = ProductController();
    _productController.foodCategoryProvider.fetchMoreCategories();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_productController.foodCategoryProvider.isLoading &&
          _productController.foodCategoryProvider.hasMore) {
        _productController.foodCategoryProvider.fetchMoreCategories();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductController>.value(
      value: _productController,
      child: Consumer<ProductController>(
        builder: (context, controller, child) {
          final provider = controller.foodCategoryProvider;

          if (provider.categories.isEmpty && provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text(provider.errorMessage));
          }

          return SizedBox(
            height: 130.h,             child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount:
                  provider.categories.length + (provider.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < provider.categories.length) {
                  final category = provider.categories[index];
                  String? imageUrl = category.thumbnailUrl ??
                      category.image ??
                      category.mediaWebUrl;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CategoryItem(
                      image: imageUrl ?? AppImages.empty,
                      label: category.title,
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
