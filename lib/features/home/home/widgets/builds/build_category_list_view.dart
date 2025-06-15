import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/home/controllers/section_controller.dart';
import 'package:shella_design/features/home/domain/models/section_model.dart';
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
    return Consumer<SectionProvider>(
      builder: (context, sectionProvider, _) {
        if (sectionProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (sectionProvider.errorMessage.isNotEmpty) {
          return Center(child: Text(sectionProvider.errorMessage));
        }

        final sections = sectionProvider.categories;

        if (sections.isEmpty) {
          return const Center(child: Text("No categories available."));
        }

        final SectionModel selectedCategory = sections[selectedIndex];
        final List<SectionModel> childCategories = selectedCategory.childes;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Parent Categories (Tabs)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(sections.length, (index) {
                    final SectionModel cat = sections[index];
                    final bool isSelected = selectedIndex == index;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CategoryItem(
                              image: cat.imageFullUrl ?? AppImages.empty,
                              label: cat.name,
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              height: 3.h,
                              width: _getTextWidth(context, cat.name) * 1.3,
                              color: isSelected
                                  ? AppColors.greenColor
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 12.h),

              if (childCategories.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: childCategories.map((child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: CategoryItem(
                          image: child.imageFullUrl ?? AppImages.empty,
                          label: child.name,
                        ),
                      );
                    }).toList(),
                  ),
                ),
            ],
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
