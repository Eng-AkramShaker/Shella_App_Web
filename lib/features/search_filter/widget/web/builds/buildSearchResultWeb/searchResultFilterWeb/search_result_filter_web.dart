import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../common/util/app_colors.dart';
import '../../../../../../../common/util/app_images.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/button/custom_button.dart';
import '../../../../../../../common/widgets/gap/width/width.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';
import '../../../../../controller/search_filter_controller.dart';

class SearchResultFilterWeb extends StatelessWidget {
  const SearchResultFilterWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (SearchFilterController.get(context).searchResultModel != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(context, text: 'نتائج البحث', style: font18Black700W(context, size: 15)),
              SizedBox(height: 5),
              Custom_Text(context,
                  text: 'تم العثور على ${SearchFilterController.get(context).searchResultModel!.items!.length} نتيجة',
                  color: AppColors.darkGreyColor),
            ],
          ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MouseRegion(
                onHover: (event) => SearchFilterController.get(context, listen: false).checkHoverView(true, true),
                onExit: (event) => SearchFilterController.get(context, listen: false).checkHoverView(false, true),
                child: GestureDetector(
                    onTap: () => SearchFilterController.get(context, listen: false).setListView(true),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: SearchFilterController.get(context).isHoverView == true &&
                                          SearchFilterController.get(context).isListViewIcon == true ||
                                      SearchFilterController.get(context).isListView == true
                                  ? AppColors.greenColor
                                  : AppColors.gryColor_3),
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                      child: SvgPicture.asset(
                        AppImages.view2,
                        height: 15.h,
                      ),
                    ))),
            SizedBox(
              width: 10,
            ),
            MouseRegion(
                onHover: (event) => SearchFilterController.get(context, listen: false).checkHoverView(true, false),
                onExit: (event) => SearchFilterController.get(context, listen: false).checkHoverView(false, false),
                child: GestureDetector(
                    onTap: () => SearchFilterController.get(context, listen: false).setListView(false),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: SearchFilterController.get(context).isHoverView == true &&
                                          SearchFilterController.get(context).isListViewIcon == false ||
                                      SearchFilterController.get(context).isListView == false
                                  ? AppColors.greenColor
                                  : AppColors.gryColor_3),
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                      child: SvgPicture.asset(
                        AppImages.view1,
                        height: 17.h,
                      ),
                    ))),
            SizedBox(
              width: 10,
            ),
            CustomButton(
              height: 30,
              width: width(context, 0.08),
              text: 'الاحدث',
              widget: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.greenColor,
                size: 15.h,
              ),
              colorBorder: AppColors.greenColor,
              colorTxt: AppColors.greenColor,
              circular: 5,
            ),
          ],
        )
      ],
    );
  }
}
