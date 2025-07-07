import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  final String iconPath;

  const SuccessIcon({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath,
      height: 24,
      width: 24,
      fit: BoxFit.contain,
    );
  }
}
