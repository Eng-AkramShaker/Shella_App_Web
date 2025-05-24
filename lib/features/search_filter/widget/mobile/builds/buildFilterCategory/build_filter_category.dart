import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import '../../../../../../common/util/app_styles.dart';

class BuildFilterCategory extends StatelessWidget {
  const BuildFilterCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context, 0.12),
      width: width(context, 1),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 5,bottom: 0),
        itemBuilder: (context, index) => Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.gryColor_3,
              child: SvgPicture.asset(AppImages.fish,colorFilter: ColorFilter.mode(AppColors.bgColor, BlendMode.srcIn),),
            ),
            SizedBox(height: 5,),
            Custom_Text(context, text: 'مطاعم',  style: font11Black500W(context)),
            SizedBox(height: 5,),
            Custom_Text(context, text: '(300)'),
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 13,),
        itemCount: 10,
      ),
    );
  }
}