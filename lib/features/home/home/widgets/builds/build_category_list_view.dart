import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/features/home/controllers/section_controller.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_shimmer_list_view.dart';
import 'package:shella_design/features/product/widgets/category/category_item.dart';
import 'package:shella_design/features/search_filter/domain/models/mostSearchedModel/most_searched_model.dart';

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
        if (sectionProvider.isLoading2) {
          // return Center(child: CircularProgressIndicator());
          return buildShimmerListView();
        }

        if (sectionProvider.errorMessage2.isNotEmpty) {
          // return Center(child: Text(sectionProvider.errorMessage));
          showCustomSnackBar(context, sectionProvider.errorMessage,
              isError: true);
          return buildShimmerListView();
        }

        //  final sections = sectionProvider.categories;
        final modules = sectionProvider.modules;
        //final SectionModel selectedCategory = sections[selectedIndex];
        //  final List<SectionModel> childCategories = selectedCategory.childes;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // reverse: true,
                child: Row(
                  children: List.generate(modules.length, (index) {
                    final Module mod = modules[index];
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
                                //   image: cat.imageFullUrl ?? AppImages.empty,
                                image: mod.thumbnailFullUrl ?? AppImages.empty,
                                label: mod.moduleName ?? "name",
                                //  label: cat.name,
                              ),
                              SizedBox(height: 7),
                              Container(
                                height: 3,
                                width: _getTextWidth(
                                        context, mod.moduleName ?? "") *
                                    1.3,
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
