import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/shimmerLoading/shimmer_loading.dart';

class BuildBannersLoading extends StatelessWidget {
  const BuildBannersLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        height: height(context, 0.15),
        decoration: BoxDecoration(
          color: AppColors.gryColor_2,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
