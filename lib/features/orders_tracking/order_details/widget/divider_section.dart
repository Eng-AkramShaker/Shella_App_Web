import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        Divider(color: AppColors.gryColor_5, thickness: 2),
        SizedBox(height: 15),
      ],
    );
  }
}
