import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
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
          SizedBox(width: width(context, 0.1),child: Custom_Text(context, text: categoryName,style: isSelected==true?font11Green400W(context,size: 12):font11Black400W(context,size: 12),textAlign: TextAlign.end)),
          SizedBox(width: 10,),
          CircleAvatar(
            backgroundImage: NetworkImage(categoryImg),
          )
        ],
      ),
    );
  }
}
