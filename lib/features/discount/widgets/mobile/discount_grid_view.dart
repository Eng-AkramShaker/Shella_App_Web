import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget discountGridView(
    {required int? itemCount,
    required Widget? Function(BuildContext context, int) itemBuilder}) {
  return GridView.builder(
      padding: EdgeInsets.all(16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.5, // تعديل النسبة لتحسين الشكل
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder);
}
