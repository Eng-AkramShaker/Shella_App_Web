import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/app_colors.dart';

class DragIndicator extends StatelessWidget {
  const DragIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 5,
      decoration: BoxDecoration(
        color: AppColors.gryColor_3,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
