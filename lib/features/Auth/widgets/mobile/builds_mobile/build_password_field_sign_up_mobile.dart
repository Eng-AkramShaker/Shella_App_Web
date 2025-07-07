import 'package:flutter/material.dart';

Widget buildPasswordFieldSignUp(
    String hintTexts, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: true,
    decoration: InputDecoration(
      hintText: hintTexts,
      suffixIcon: Icon(Icons.visibility_off),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      filled: false,
    ),
  );
}
