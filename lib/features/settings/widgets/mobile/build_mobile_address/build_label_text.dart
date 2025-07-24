import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildLabelTextAddress(
    bool isEditing,
    ) {
  return Text(
    isEditing ? "تعديل العنوان" : "أضف عنوان جديد",
    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
  );
}