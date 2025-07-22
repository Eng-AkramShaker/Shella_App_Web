import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';

Widget selectableButton(String text, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(border: Border.all(color: color), borderRadius: BorderRadius.circular(10)),
    child: Text(text, style: TextStyle(fontSize: 16, color: color)),
  );
}
