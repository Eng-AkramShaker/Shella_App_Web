import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';

class ToggleButtonWidget extends StatelessWidget {
  final bool isPressed;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  final FontWeight? fontweight;
  final TextStyle? style;

  const ToggleButtonWidget({
    super.key,
    required this.isPressed,
    required this.icon,
    required this.label,
    required this.onTap,
    this.fontweight,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isPressed ? AppColors.gryColor_3 : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.gryColor_3),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isPressed ? AppColors.backgroundColor : AppColors.bgColor,
            ),
            const SizedBox(width: 10),
            Custom_Text(context, text: label, style: style),
          ],
        ),
      ),
    );
  }
}
