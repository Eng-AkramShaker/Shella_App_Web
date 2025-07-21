import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

class GreenLoadingCircle extends StatelessWidget {
  const GreenLoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: AppColors.primaryColor,
    ));
  }
}
