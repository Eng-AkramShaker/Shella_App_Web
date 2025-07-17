import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import '../../../../util/app_colors.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key, this.isSearchScreen});

  final bool? isSearchScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      // width: width(context, 0.3),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.backgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            suffixIcon: const Icon(Icons.search),
            suffixIconColor: AppColors.gryColor_3,
            hintText: "ابحث عن المتاجر او المطاعم او المنتجات المرادة...",
            hintStyle: TextStyle(fontSize: 16, color: AppColors.gryColor_3),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          onChanged: (value) {
            if (isSearchScreen == true) {
              EasyDebounce.debounce('search products', Duration(milliseconds: 700), () {
                if (value.trim().isNotEmpty) {
                  SearchFilterController.get(context, listen: false).saveSearchHistory(value);
                }
                SearchFilterController.get(context, listen: false).searchItems(value: value);
              });
            }
          },
        ),
      ),
    );
  }
}
