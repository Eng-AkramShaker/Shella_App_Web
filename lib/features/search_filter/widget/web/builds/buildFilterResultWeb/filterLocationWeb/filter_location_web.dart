import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/button/custom_button.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';

class FilterLocationWeb extends StatelessWidget {
  const FilterLocationWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 17,),
        Custom_Text(context, text: 'الموقع',style: font11Black400W(context,size: 13)),
        SizedBox(height: 17,),
        CustomButton(
          height: 30,
          width: width(context, 0.4),
          text: 'كل المناطق',
          widget: Padding(
            padding: EdgeInsets.only(left: width(context, 0.09)),
            child: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.greenColor,),
          ),
          color: AppColors.wtColor_3,
          textSize: 13,
          circular: 5,
        ),
        SizedBox(height: 13,),
        CustomButton(
          height: 30,
          width: width(context, 0.4),
          text: 'مسافة التوصيل',
          widget: Padding(
            padding: EdgeInsets.only(left: width(context, 0.07)),
            child: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.greenColor,),
          ),
          color: AppColors.wtColor_3,
          textSize: 13,
          circular: 5,
        ),
      ],
    );
  }
}