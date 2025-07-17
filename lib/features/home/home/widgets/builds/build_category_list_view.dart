import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
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
          return Center(child: CircularProgressIndicator());
        }

        if (sectionProvider.errorMessage.isNotEmpty) {
          return Center(child: Text(sectionProvider.errorMessage));
        }

        final sections = sectionProvider.categories;
        final SectionModel selectedCategory = sections[selectedIndex];
        final List<SectionModel> childCategories = selectedCategory.childes;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  children: List.generate(sections.length, (index) {
                    final SectionModel cat = sections[index];
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
                                image: cat.imageFullUrl ?? AppImages.empty,
                                label: cat.name,
                              ),
                              SizedBox(height: 7),
                              Container(
                                height: 3,
                                width: _getTextWidth(context, cat.name) * 1.3,
                                color: selectedIndex == index ? AppColors.greenColor : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // Optional spacing
              SizedBox(height: 12.h),

              //////////////// Child categories////////////////////
              // if (childCategories.isNotEmpty)
              //   SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     reverse: true,
              //     child: Row(
              //       children: childCategories.map((child) {
              //         return Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 6.w),
              //           child: CategoryItem(
              //             image: child.imageFullUrl ?? AppImages.empty,
              //             label: child.name,
              //           ),
              //         );
              //       }).toList(),
              //     ),
              //   ),
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
