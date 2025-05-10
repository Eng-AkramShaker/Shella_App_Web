import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_styles.dart';

class Evaluation extends StatelessWidget {
  final double evaluationdegree;
  const Evaluation({super.key, required this.evaluationdegree});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
              height: 60,
              width: 60,
              color: AppColors.gryColor_9,
              child: custom_Images_asset(
                  image: AppImages.correctsign, w: 33, h: 33)),
        ),
        SizedBox(height: 10),
        Custom_Text(context,
            text: "كيف كانت تجربتك ؟",
            style: font11Black500W(context, size: size_21(context))),
        SizedBox(height: 10),
        Custom_Text(context,
            text: "نود معرفة رايك في الخدمة المقدمة",
            style: font10Grey400W(context, size: size_16(context))),
        Spacer(flex: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(flex: 2),
            Icon(Icons.star,
                size: 32,
                color: evaluationdegree == 5
                    ? AppColors.gold
                    : AppColors.gryColor_3),
            Spacer(flex: 1),
            Icon(Icons.star,
                size: 32,
                color: evaluationdegree >= 4
                    ? AppColors.gold
                    : AppColors.gryColor_3),
            Spacer(flex: 1),
            Icon(Icons.star,
                size: 32,
                color: evaluationdegree >= 3
                    ? AppColors.gold
                    : AppColors.gryColor_3),
            Spacer(flex: 1),
            Icon(Icons.star,
                size: 32,
                color: evaluationdegree >= 2
                    ? AppColors.gold
                    : AppColors.gryColor_3),
            Spacer(flex: 1),
            Icon(Icons.star,
                size: 32,
                color: evaluationdegree >= 1
                    ? AppColors.gold
                    : AppColors.gryColor_3),
            Spacer(flex: 2),
          ],
        ),
        Spacer(flex: 1),
      ],
    );
  }
}
