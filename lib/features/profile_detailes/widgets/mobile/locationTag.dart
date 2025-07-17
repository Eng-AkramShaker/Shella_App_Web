import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget locationTag(
    {required IconData icon, required String label, required Color color}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Icon(icon, color: color, size: 25.r),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}
