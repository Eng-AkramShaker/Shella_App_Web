import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget _buildShimmerCategoryItem() {
  return Padding(
    padding: EdgeInsets.only(right: 10.w, left: 3.w),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60.w, // Match CategoryItem's image width
          height: 60.w, // Match CategoryItem's image height
          decoration: BoxDecoration(
            color: Colors.white, // Shimmer base color
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(height: 5.h), // Match spacing in CategoryItem
        Container(
          width: 50.w, // Placeholder for text width
          height: 10.h, // Placeholder for text height
          color: Colors.white, // Shimmer base color
        ),
        SizedBox(height: 7.h), // Match spacing in CategoryItem
        Container(
          height: 3,
          width: 40.w, // Placeholder for underline width
          color: Colors.white, // Shimmer base color
        ),
      ],
    ),
  );
}

// --- Shimmer Effect for the entire list view ---
Widget buildShimmerListView() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!, // Light grey
    highlightColor: Colors.grey[100]!, // Lighter grey for highlight
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5, // Number of shimmer items to display (e.g., 5-7 items)
          (index) => _buildShimmerCategoryItem(),
        ),
      ),
    ),
  );
}
