import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/common/widgets/shimmerLoading/shimmer_loading.dart';

class BuildCategoryLoading extends StatelessWidget {
  const BuildCategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(4, (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: height(context, 0.1),
              width: width(context, 0.2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.gryColor_2
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}