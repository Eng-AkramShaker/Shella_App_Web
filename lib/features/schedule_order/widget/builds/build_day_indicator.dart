import 'package:flutter/material.dart';
import 'package:shella_design/util/app_colors.dart';

Widget buildDayIndicator(String day, String selectedDay) => Expanded(
      child: Container(
        height: 2,
        color:
            selectedDay == day ? AppColors.primaryColor : AppColors.gryColor_3,
      ),
    );
