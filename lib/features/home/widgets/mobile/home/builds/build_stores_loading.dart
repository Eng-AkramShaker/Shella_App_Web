import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/shimmerLoading/shimmer_loading.dart';

class BuildStoresLoading extends StatelessWidget {
  const BuildStoresLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Column(
        children: List.generate(4, (index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: height(context, 0.23),
          decoration: BoxDecoration(
            color: AppColors.gryColor_2,
            borderRadius: BorderRadius.circular(10),
          ),
          ),
        ),
        ),
      ),
    );
  }
}
