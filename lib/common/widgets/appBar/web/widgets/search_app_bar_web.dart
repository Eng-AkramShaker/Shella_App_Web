import 'package:flutter/material.dart';
import '../../../../util/app_colors.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
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
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            suffixIcon: const Icon(Icons.search),
            suffixIconColor: AppColors.gryColor_3,
            hintText: "ابحث عن المتاجر او المطاعم او المنتجات المرادة...",
            hintStyle: TextStyle(fontSize: 16, color: AppColors.gryColor_3),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }
}