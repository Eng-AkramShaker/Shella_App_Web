import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ExpiredContainer extends StatelessWidget {
  const ExpiredContainer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      decoration: BoxDecoration(
          border: Border(
              bottom: index == 1
                  ? BorderSide(
                      color: AppColors.greenColor,
                      width: 2,
                    )
                  : BorderSide.none)),
      child: Custom_Text(
        context,
        text: 'منتهية الصلاحية',
        style: font14Black400W(context, size: 14),
      ),
    );
  }
}
