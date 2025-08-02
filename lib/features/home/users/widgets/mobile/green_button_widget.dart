import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget greenButtonWidget({required String text}) {
  return Container(
    height: 35,
    width: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: AppColors.greenColor),
    child: Center(
        child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    )),
  );
}
