import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class TechnicalInfo extends StatelessWidget {
  final bool isicon;
  final Color? color;
  const TechnicalInfo({super.key, required this.isicon, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        child: Card(
            color: color ?? AppColors.backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(child: custom_Images_asset(image: AppImages.man, h: 48, w: 48)),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(context, text: "احمد محمد", style: font11Black500W(context, size: size_16(context))),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: AppColors.gold,
                          ),
                          Custom_Text(context, text: "4.7", style: font12Black300W(context, size: size_14(context)))
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  isicon
                      ? ClipOval(
                          child: Container(
                            height: 48,
                            width: 48,
                            color: AppColors.lightBlue,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.manage_accounts),
                              iconSize: 24,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            )));
  }
}
