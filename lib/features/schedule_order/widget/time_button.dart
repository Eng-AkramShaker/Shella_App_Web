import 'package:flutter/material.dart';
import 'package:shella_design/util/app_colors.dart';

class TimeButton extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeButton({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.gryColor_3, width: 2),
          color: isSelected ? AppColors.greenColor : AppColors.backgroundColor,
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.backgroundColor : AppColors.bgColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
