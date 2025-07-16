import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ArrivalTime extends StatelessWidget {
  const ArrivalTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightBlue,
        ),
        height: 45,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Custom_Text(context, text: "الوصول المتوقع : 15 دقيقة", style: font10Grey500W(context, size: size_12(context))),
            Spacer(),
            Custom_Text(context, text: "في الطريق ", style: font11Black500W(context, size: size_12(context))),
            ClipOval(
              child: Container(
                height: 8,
                width: 8,
                color: AppColors.greenColor,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
