import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';
import '../../../../../controller/search_filter_controller.dart';

class SearchResultListViewWeb extends StatelessWidget {
  const SearchResultListViewWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 10,top: 10),
      itemBuilder: (context, index) => MouseRegion(
        onHover: (event) => SearchFilterController.get(context,listen: false).checkHover(true, index),
        onExit: (event) => SearchFilterController.get(context,listen: false).checkHover(false, index),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: SearchFilterController.get(context).isHover==true&&SearchFilterController.get(context).containerIndex==index?Border.all(color: AppColors.greenColor):null
          ),
          padding: SearchFilterController.get(context).isHover==true&&SearchFilterController.get(context).containerIndex==index?EdgeInsets.symmetric(horizontal: 5,vertical: 10):null,
          child: Row(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.network(SearchFilterController.get(context).mixedList[index]['img']??'',height: 130.h,width: 40.w,fit: BoxFit.fill,errorBuilder: (context, error, stackTrace) => const SizedBox(),)),
              SizedBox(width: 10,),
              Expanded(child: Custom_Text(context, text: SearchFilterController.get(context).mixedList[index]['name']??'', style: font10Black400W(context, size: 14))),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(height: 30,),
      itemCount: SearchFilterController.get(context).mixedList.length
    );
  }
}