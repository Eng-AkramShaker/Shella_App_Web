import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button_2.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class TechnicalDetails extends StatelessWidget {
  const TechnicalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 270,
        child: Card(
            color: AppColors.backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(context, text: "تفاصيل الفني", style: font11Black500W(context, size: size_16(context))),
                    Row(
                      children: [
                        ClipOval(child: custom_Images_asset(image: AppImages.man, h: 48, w: 48)),
                        Column(
                          children: [
                            Custom_Text(context, text: "احمد محمد", style: font11Black500W(context, size: size_12(context))),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: AppColors.gold,
                                ),
                                Custom_Text(context, text: "4.7", style: font12Black300W(context, size: size_13(context)))
                              ],
                            ),
                            Custom_Text(context, text: "خبرة 8 سنوات", style: font12Black300W(context))
                          ],
                        )
                      ],
                    ),
                    Custom_Text(context, text: "الوصول المتوقع", style: font11Black500W(context, size: size_16(context))),
                    Custom_Text(context, text: "9:15 - 9:45", style: font12Green600W(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: custom_Button(context,
                              title: "رسالة",
                              borderwidth: 1,
                              style: font12Green600W(
                                context,
                                size: size_16(context),
                              ),
                              onPressed: () {},
                              buttoncolor: AppColors.backgroundColor,
                              bordersidecolor: AppColors.greenColor,
                              isIcon: true,
                              icon: Icons.message_outlined,
                              iconcolor: AppColors.greenColor),
                        ),
                        Expanded(
                            child: custom_Button(context,
                                title: "اتصال",
                                borderwidth: 1,
                                style: font12Green600W(context, size: size_16(context)),
                                onPressed: () {},
                                buttoncolor: AppColors.backgroundColor,
                                bordersidecolor: AppColors.greenColor,
                                isIcon: true,
                                icon: Icons.call,
                                iconcolor: AppColors.greenColor))
                      ],
                    )
                  ],
                ))));
  }
}
