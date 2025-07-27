import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/lists.dart';

class CategoriesSelectList extends StatefulWidget {
  const CategoriesSelectList({super.key});

  @override
  State<CategoriesSelectList> createState() => _CategoriesSelectListState();
}

class _CategoriesSelectListState extends State<CategoriesSelectList> {
  List<Category> categories = [
    Category(selected: true, name: 'الحميع'),
    Category(selected: false, name: 'انضم حديثا'),
    Category(selected: false, name: 'شائع'),
  ];
  bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: SizedBox(
        height: 35,
        child: Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(10),
              width: 50,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                    color: categories[index].selected
                        ? AppColors.greenColor
                        : Colors.grey.shade200),
              ),
              child: Center(
                  child: Text(
                categories[index].name,
                style: TextStyle(
                    fontSize: 10,
                    color: categories[index].selected
                        ? AppColors.greenColor
                        : Colors.grey),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class Category {
  final bool selected;
  final String name;

  Category({required this.selected, required this.name});
}
