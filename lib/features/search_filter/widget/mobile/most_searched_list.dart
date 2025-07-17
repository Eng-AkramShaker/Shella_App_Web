import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/common/util/app_styles.dart';

class MostSearchedList extends StatelessWidget {
  const MostSearchedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.59,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 10),
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                  height: 75.h,
                  width: 107.w,
                  child: Image.network(SearchFilterController.get(context).mostSearchedModel!.products![index].imageFullUrl ?? '',
                      errorBuilder: (context, error, stackTrace) => const SizedBox(), fit: BoxFit.fill)),
              SizedBox(width: 15),
              Expanded(
                  child: Custom_Text(context,
                      text: SearchFilterController.get(context).mostSearchedModel!.products![index].name ?? '',
                      style: font10Black400W(context, size: 11))),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ),
        itemCount: SearchFilterController.get(context).mostSearchedModel!.products!.length,
      ),
    );
  }
}
