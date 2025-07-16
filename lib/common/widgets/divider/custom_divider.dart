import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/app_colors.dart';

class Custom_Divider extends StatelessWidget {
  final double thickness;
  final double height;
  final Color color;
  final double indent;
  final double endIndent;
  final bool dashed;

  const Custom_Divider({
    super.key,
    this.thickness = 1.0,
    this.height = 20.0,
    this.color = AppColors.gryColor_2,
    this.indent = 0,
    this.endIndent = 0,
    this.dashed = false,
  });

  @override
  Widget build(BuildContext context) {
    return dashed
        ? _buildDashedDivider() // خط متقطع
        : Divider(
            thickness: thickness,
            height: height,
            color: color,
            indent: indent,
            endIndent: endIndent,
          );
  }

  Widget _buildDashedDivider() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double dashWidth = 5.0;
        final double dashSpace = 3.0;
        final int dashCount = (constraints.constrainWidth() / (dashWidth + dashSpace)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (index) {
            return Container(
              width: dashWidth,
              height: thickness,
              color: color,
            );
          }),
        );
      },
    );
  }
}
