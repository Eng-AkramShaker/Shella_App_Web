import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'builds/build_category_button.dart';

class CategoryTabs extends StatefulWidget {
  final int initialCategory;
  final ValueChanged<int> onCategoryChanged;

  const CategoryTabs({
    super.key,
    required this.initialCategory,
    required this.onCategoryChanged,
  });

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  @override
  Widget build(BuildContext context) {
    final searchFilterController = Provider.of<SearchFilterController>(context);
    return Card(
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: AppColors.gryColor_3)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildCategoryButton(context, 'المنتجات', () {
              setState(() => searchFilterController.selectedCategory = 0);
              widget.onCategoryChanged(0);
            }, searchFilterController.selectedCategory == 0 ? AppColors.secondaryColor : AppColors.backgroundColor),
            buildCategoryButton(context, 'كل المتاجر', () {
              setState(() => searchFilterController.selectedCategory = 1);
              widget.onCategoryChanged(1);
            }, searchFilterController.selectedCategory == 1 ? AppColors.secondaryColor : AppColors.backgroundColor),
          ],
        ),
      ),
    );
  }
}
