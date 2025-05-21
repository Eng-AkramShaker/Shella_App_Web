import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../../common/util/app_styles.dart';
import '../../../../../../../../common/widgets/texts/custom_text.dart';

class CategoryInfoWeb extends StatelessWidget {
  const CategoryInfoWeb({super.key, required this.categoryImg, required this.categoryName, required this.categoryCount});

  final String categoryImg;
  final String categoryName;
  final String categoryCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(categoryImg),
        Custom_Text(context, text: categoryName,style: font11Black400W(context,size: 13)),
        Spacer(),
        Custom_Text(context, text: '($categoryCount)',style: font11Black400W(context,size: 13)),
      ],
    );
  }
}
