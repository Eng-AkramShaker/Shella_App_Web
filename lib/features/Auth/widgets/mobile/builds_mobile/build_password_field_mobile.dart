import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget buildPasswordField(String hintText, {TextEditingController? controller}) {
  return TextField(
    controller: controller,
    obscureText: true,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: const Icon(Icons.visibility_off),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.greenColor,
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.greenColor,
          width: 2,
        ),
      ),
    ),
  );
}
