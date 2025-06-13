import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> img = ['9', '19', '20'];
    List<String> titles = ["السندويش", "البيتزا", "المشروبات"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(img.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CategoryItem(
              image: 'assets/images/${img[index]}.png',
              label: titles[index],
            ),
          );
        },),
      ),
    );
  }
}
