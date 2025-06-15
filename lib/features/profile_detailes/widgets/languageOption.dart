import 'package:flutter/material.dart';

Widget buildLanguageOption({
  required String title,
  required String subtitle,
  required bool isSelected,
}) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? Colors.white : Colors.grey[100],
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
          color: isSelected ? Colors.green : Colors.transparent, width: 2),
    ),
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Icon(Icons.waving_hand, color: Colors.green, size: 20),
          ],
        ),
        SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    ),
  );
}
