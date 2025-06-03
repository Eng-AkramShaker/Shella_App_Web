import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ExpiredPointContainerMobile extends StatelessWidget {
  const ExpiredPointContainerMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), border: Border.all(width: 1, color: AppColors.orangeColor)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/dangerous.svg'),
              SizedBox(
                width: 20.w,
              ),
              Custom_Text(context,
                  text: '200 نقطة تنتهي صلاحيتها في 2/2/2025',
                  style: font10Grey400W(context),
                  textOverFlow: TextOverflow.ellipsis,
                  maxLines: 1)
            ],
          ),
        ),
      ),
    );
  }
}
