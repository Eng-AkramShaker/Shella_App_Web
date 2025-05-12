import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';

class HomeServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final bool selected;
  const HomeServiceCard({
    super.key,
    required this.selected,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: (selected) ? AppColors.secondaryColor : AppColors.gryColor_3,
          width: 2.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 5.h,
            ),
            child: Image.asset(image),
          ),
          SizedBox(height: 10),
          Custom_Text(
            context,
            text: title,
            size: 12,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
