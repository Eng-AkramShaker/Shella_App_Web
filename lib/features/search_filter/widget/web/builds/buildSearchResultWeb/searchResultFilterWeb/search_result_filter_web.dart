import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../common/util/app_colors.dart';
import '../../../../../../../common/util/app_images.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/button/custom_button.dart';
import '../../../../../../../common/widgets/gap/width/width.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';

class SearchResultFilterWeb extends StatelessWidget {
  const SearchResultFilterWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_Text(context, text: 'نتائج البحث',style: font18Black700W(context,size: 15)),
            SizedBox(height: 5),
            Custom_Text(context, text: 'تم العثور على 245 نتيجة',color: AppColors.darkGreyColor),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                CustomButton(height: 30,width: width(context, 0.03),text: '',textSize: 0,isSpacer: true,paddingRight: 5,widget: SvgPicture.asset(AppImages.view2),colorBorder: AppColors.gryColor_3,circular: 5,),
                SizedBox(width: 10,),
                CustomButton(height: 30,width: width(context, 0.03),text: '',textSize: 0,isSpacer: true,paddingRight: 5,widget: SvgPicture.asset(AppImages.view1),colorBorder: AppColors.gryColor_3,circular: 5,),
                SizedBox(width: 10,),
                CustomButton(height: 30,width: width(context, 0.08),text: 'الاحدث',widget: Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.greenColor,),colorBorder: AppColors.greenColor,colorTxt: AppColors.greenColor,circular: 5,),
              ],
            )
          ],
        )
      ],
    );
  }
}
