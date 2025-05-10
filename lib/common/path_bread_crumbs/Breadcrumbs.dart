import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_navigators.dart';

class Breadcrumbs extends StatelessWidget {
  final List<List> paths;

  const Breadcrumbs(this.paths, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        children: List.generate(paths.length, (index) {
          final path = paths[index];
          final isLast = index == paths.length - 1; // Check if it's the last item

          return Row(
            children: [
              GestureDetector(
                onTap: () => pushNewScreen(context, path[0]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Custom_Text(
                    context,
                    text: path[1],
                    size: 14,
                    color: path[2] ? AppColors.primaryColor : AppColors.bgColor,
                  ),
                ),
              ),
              if (!isLast) // Hide the arrow if it's the last item
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.bgColor,
                ),
            ],
          );
        }),
      ),
    );
  }
}
