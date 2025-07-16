import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';

Widget buildTextField(String hintText, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      filled: false,
    ),
  );
}
