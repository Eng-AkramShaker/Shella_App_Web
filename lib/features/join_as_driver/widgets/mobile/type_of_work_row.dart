import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/drop_choice/drop_choice.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/join_as_driver/controllers/join_as_driver_controller.dart';

class TypeOfWorkRow extends StatefulWidget {
  const TypeOfWorkRow({
    super.key,
  });

  @override
  State<TypeOfWorkRow> createState() => _TypeOfWorkRowState();
}

class _TypeOfWorkRowState extends State<TypeOfWorkRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DropChoice(
            provider: context.read<DriverRegisterController>().setEarning,
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
            provider: context.read<DriverRegisterController>().setZoneId,
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
