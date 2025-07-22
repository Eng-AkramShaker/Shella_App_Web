import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

class IconButtonCircle extends StatelessWidget {
  final IconData icon;
  final double? height;
  final double? width;
  final double? iconsize;
  final Color? color;
  final Color? iconcolor;
  final VoidCallback onPressed;
  const IconButtonCircle({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color,
    this.iconcolor,
    this.height,
    this.width,
    this.iconsize,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? AppColors.backgroundColor,
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: width ?? 30,
          height: height ?? 30,
          alignment: Alignment.center,
          child: Icon(icon,
              color: iconcolor ?? Colors.black, size: iconsize ?? 24),
        ),
      ),
    );
  }
}
