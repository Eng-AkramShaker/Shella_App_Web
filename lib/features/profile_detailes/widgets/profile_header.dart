import 'package:flutter/material.dart';

Widget buildProfileHeader() {
  return Container(
    padding: EdgeInsets.all(16),
    color: Colors.white,
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, size: 40, color: Colors.grey[600]),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'نورا احمد',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'معلومات الحساب',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        )
      ],
    ),
  );
}
