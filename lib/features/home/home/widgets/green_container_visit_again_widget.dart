import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget greenContainerVisitAgain() {
  return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      height: 150,
      width: double.infinity);
}
