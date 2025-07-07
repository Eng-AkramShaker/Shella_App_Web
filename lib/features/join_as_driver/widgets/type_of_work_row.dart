import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/drop_choice/drop_choice.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class TypeOfWorkRow extends StatelessWidget {
  const TypeOfWorkRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DropChoice(
            title: 'حدد نوع العمل',
            titleChoiceOne: 'مستقل',
            titleChoiceTwo: 'راتب',
            height: 31.h,
            width: 150.w,
            titleBackgroundColor: AppColors.gryColor_5.withOpacity(.5),
            titleStyle: font10Black600W(context),
            titleChoiceStyle: font10Black400W(context),
          ),
        ),
        Expanded(
          child: DropChoice(
            title: 'Demo Zone',
            titleChoiceOne: 'Portsaid',
            titleChoiceTwo: 'طويق',
            titleBackgroundColor: AppColors.gryColor_5.withOpacity(.5),
            height: 31.h,
            width: 150.w,
            titleStyle: font10Black600W(context),
            titleChoiceStyle: font10Black400W(context),
          ),
        )
      ],
    );
  }
}
