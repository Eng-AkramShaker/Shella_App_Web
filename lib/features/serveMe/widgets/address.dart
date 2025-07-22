import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: Card(
            color: AppColors.backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(context, text: "العنوان", style: font11Black500W(context, size: size_16(context))),
                    Card(
                      color: AppColors.gryColor_8,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.gryColor_3), borderRadius: BorderRadius.circular(10.0)),
                      child: SizedBox(
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.home_outlined,
                                size: 25,
                                color: AppColors.greenColor,
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Custom_Text(context, text: "المنزل", style: font10Black400W(context)),
                                  Custom_Text(context, text: "السعودية , الرياض 55552333", style: font10Grey400W(context)),
                                ],
                              ),
                              Spacer(flex: 1),
                              Icon(
                                Icons.edit_outlined,
                                size: 20,
                                color: AppColors.greenColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
