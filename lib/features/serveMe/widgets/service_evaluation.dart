import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

class ServiceEvaluation extends StatelessWidget {
  final int evaluationnum;
  final double evaluationdegree;
  final String image;
  const ServiceEvaluation(
      {super.key,
      required this.evaluationnum,
      required this.image,
      required this.evaluationdegree});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 252,
      child: Card(
        color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              custom_Images_asset(image: image, h: 190, w: 350),
              Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custom_Text(context,
                      text: "$evaluationnum تقييم",
                      style: font10Black300W(context, size: size_14(context))),
                  SizedBox(
                    height: 20,
                    width: 152,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Custom_Text(context,
                            text: "$evaluationdegree",
                            style: font10Black300W(context,
                                size: size_14(context))),
                        Spacer(flex: 1),
                        Icon(Icons.star,
                            size: 20,
                            color: evaluationdegree == 5
                                ? AppColors.gold
                                : AppColors.bgColor),
                        Spacer(flex: 1),
                        Icon(Icons.star,
                            size: 20,
                            color: evaluationdegree >= 4
                                ? AppColors.gold
                                : AppColors.bgColor),
                        Spacer(flex: 1),
                        Icon(Icons.star,
                            size: 20,
                            color: evaluationdegree >= 3
                                ? AppColors.gold
                                : AppColors.bgColor),
                        Spacer(flex: 1),
                        Icon(Icons.star,
                            size: 20,
                            color: evaluationdegree >= 2
                                ? AppColors.gold
                                : AppColors.bgColor),
                        Spacer(flex: 1),
                        Icon(Icons.star,
                            size: 20,
                            color: evaluationdegree >= 1
                                ? AppColors.gold
                                : AppColors.bgColor),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
