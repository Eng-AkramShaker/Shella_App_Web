import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/util/app_colors.dart';
import '../../../../../../../../common/util/app_styles.dart';
import '../../../../../../../../common/widgets/texts/custom_text.dart';

class CategoryInfoWeb extends StatelessWidget {
  const CategoryInfoWeb({super.key, required this.categoryImg, required this.categoryName, required this.categoryCount,this.isSelected});

  final String categoryImg;
  final String categoryName;
  final String categoryCount;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Custom_Text(context, text: '($categoryCount)',style: isSelected==true?font11Green400W(context,size: 13):font11Black400W(context,size: 13)),
          Spacer(),
          Custom_Text(context, text: categoryName,style: isSelected==true?font11Green400W(context,size: 12):font11Black400W(context,size: 12)),
          SizedBox(width: 10,),
          SvgPicture.asset(categoryImg,colorFilter: ColorFilter.mode(isSelected==true?AppColors.greenColor:AppColors.gryColor_2, BlendMode.srcIn),),
        ],
      ),
    );
  }
}
