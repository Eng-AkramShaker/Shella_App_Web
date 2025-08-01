import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../common/util/app_dimensions.dart';
import '../../../../../../common/util/app_styles.dart';
import '../../../../../../common/widgets/texts/custom_text.dart';
import '../../../../controller/search_filter_controller.dart';

class BuildSearchItems extends StatelessWidget {
  const BuildSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.67,
      child: SearchFilterController.get(context).searchResultModel!.items!.isEmpty
          ? Padding(
              padding: EdgeInsets.only(bottom: 150.h),
              child:
                  Center(child: Custom_Text(context, text: 'لا يوجد منتجات', style: font10Black300W(context, size: size_14(context)))),
            )
          : ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 10, top: 10),
              itemBuilder: (context, index) => Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            SearchFilterController.get(context).searchResultModel!.items![index].imageFullUrl ?? '',
                            height: 80.h,
                            width: 70.w,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) => const SizedBox(),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Custom_Text(context,
                              text: SearchFilterController.get(context).searchResultModel!.items![index].name ?? '',
                              style: font10Black400W(context, size: 11))),
                    ],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: SearchFilterController.get(context).searchResultModel!.items!.length),
    );
  }
}
