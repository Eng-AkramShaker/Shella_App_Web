import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/search_filter/widget/builds/build_category_button.dart';
import 'package:shella_design/common/util/app_colors.dart';

class CategoryTabs extends StatefulWidget {
  final String initialCategory;
  final ValueChanged<String> onCategoryChanged;

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
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildCategoryButton(context, 'اصناف المتاجر', () {
              setState(() => searchFilterController.selectedCategory = 'اصناف المتاجر');
              widget.onCategoryChanged('اصناف المتاجر');
            }, searchFilterController.selectedCategory == 'اصناف المتاجر' ? AppColors.secondaryColor : AppColors.backgroundColor),
            buildCategoryButton(context, 'المطاعم والمتاجر', () {
              setState(() => searchFilterController.selectedCategory = 'المطاعم والمتاجر');
              widget.onCategoryChanged('المطاعم والمتاجر');
            }, searchFilterController.selectedCategory == 'المطاعم والمتاجر' ? AppColors.secondaryColor : AppColors.backgroundColor),
            buildCategoryButton(context, 'اصناف المطاعم', () {
              setState(() => searchFilterController.selectedCategory = 'اصناف المطاعم');
              widget.onCategoryChanged('اصناف المطاعم');
            }, searchFilterController.selectedCategory == 'اصناف المطاعم' ? AppColors.secondaryColor : AppColors.backgroundColor),
          ],
        ),
      ),
    );
  }
}
