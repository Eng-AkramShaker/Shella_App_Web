import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

class AddressButton extends StatelessWidget {
  final bool isSelected;
  final Function() onPressed;
  final IconData icon;
  const AddressButton({
    super.key,
    required this.isSelected,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.wtColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: isSelected == true
                  ? AppColors.gryColor_3
                  : AppColors.secondaryColor,
              width: 1.5),
        ),
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Center(
        child: Icon(
          icon,
          size: 35,
          color: isSelected == true
              ? AppColors.primaryColor
              : AppColors.gryColor_3,
        ),
      ),
    );
  }
}
