import 'package:flutter/material.dart';
import 'package:shella_design/util/app_colors.dart';

class CloseButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CloseButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.close,
        color: AppColors.backgroundColor,
        size: 30,
      ),
      onPressed: onPressed,
    );
  }
}
