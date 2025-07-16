import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import '../../../../../../../common/util/app_colors.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/textField/custom_textfield_2.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';

class PriceRangeWeb extends StatelessWidget {
  const PriceRangeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 10,
        ),
        Custom_Text(context, text: 'نطاق السعر', style: font11Black400W(context, size: 13)),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              height: 30,
              width: width(context, 0.095),
              labelText: 'من',
              borderColor: AppColors.gryColor_3,
            ),
            CustomTextField(
              height: 30,
              width: width(context, 0.095),
              labelText: 'الى',
              borderColor: AppColors.gryColor_3,
            ),
          ],
        )
      ],
    );
  }
}
