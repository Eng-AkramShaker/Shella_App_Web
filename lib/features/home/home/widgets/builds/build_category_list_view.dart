import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/home/controllers/category_controller.dart';
import 'package:shella_design/features/home/domain/models/category_model.dart';
import 'package:shella_design/features/product/widgets/category/category_item.dart';

class BuildCategoryListView extends StatefulWidget {
  const BuildCategoryListView({super.key});

  @override
  State<BuildCategoryListView> createState() => _BuildCategoryListViewState();
}

class _BuildCategoryListViewState extends State<BuildCategoryListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, _) {
        if (categoryProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (categoryProvider.errorMessage.isNotEmpty) {
          return Center(child: Text(categoryProvider.errorMessage));
        }

        final categories = categoryProvider.categories;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              children: List.generate(categories.length, (index) {
                final CategoryModel cat = categories[index];
                return Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 3.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 13, left: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CategoryItem(
                              image: cat.imageFullUrl, label: cat.name),
                          SizedBox(height: 7),
                          Container(
                            height: 3,
                            width: _getTextWidth(context, cat.name) * 1.3,
                            color: selectedIndex == index
                                ? AppColors.greenColor
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  double _getTextWidth(BuildContext context, String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: font10Black400W(context)),
      maxLines: 1,
      textDirection: TextDirection.rtl,
    )..layout();
    return textPainter.width;
  }
}
