import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/search_filter/widget/mobile/category_tabs.dart';
import 'package:shella_design/features/search_filter/widget/mobile/location_header.dart';
import 'package:shella_design/features/search_filter/widget/mobile/search_history_section.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../../widget/mobile/most_searched_list.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    final searchFilterController = Provider.of<SearchFilterController>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Custom_Text(
          context,
          text: "بحث",
          color: AppColors.bgColor,
          style: font10Black600W(context, size: size_14(context)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationHeader(
                num: searchFilterController.cartNum,
                sites: searchFilterController.sites,
              ),
              CustomTextField(
                radius: 20,
                borderWidth: 2,
                borderColor: AppColors.gryColor_3,
                padding: 0,
                labelText: 'البحث',
                prefixIcon: Icon(Icons.search, size: 25),
                onChanged: (value){
                  searchFilterController.searchItems(value: value);
                },
              ),
              CategoryTabs(
                initialCategory: searchFilterController.selectedCategory,
                onCategoryChanged: (category) => setState(() => searchFilterController.selectedCategory = category),
              ),
              SearchHistorySection(
                previousSearches: searchFilterController.previousSearches,
                context: context,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Custom_Text(context, text: "الأكثر بحثآ", style: font10Grey400W(context, size: size_12(context))),
              ),
              SizedBox(height: 10),
              MostSearchedList()
            ],
          ),
        ),
      ),
    );
  }
}