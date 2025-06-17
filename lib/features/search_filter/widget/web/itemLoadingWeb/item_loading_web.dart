import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/gap/gapHeight/gap_height.dart';
import '../../../../../common/util/app_colors.dart';
import '../../../../../common/widgets/gap/height/height.dart';
import '../../../../../common/widgets/gap/width/width.dart';
import '../../../../../common/widgets/shimmerLoading/shimmer_loading.dart';

class ItemLoadingWeb extends StatelessWidget {
  const ItemLoadingWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(bottom: 30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15,childAspectRatio: (width(context, 1)/2)/height(context, 0.6)),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gryColor_3),
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              GapHeight(gap: 0.15),
              Divider(),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10,
                    width: 100,
                    color: AppColors.gryColor_2,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 10,
                    width: 70,
                    color: AppColors.gryColor_3,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 10,
                    width: 100,
                    color: AppColors.gryColor_3,
                  ),
                  SizedBox(width: 5,),
                  Icon(Icons.location_on_outlined),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 10,
                    width: 100,
                    color: AppColors.gryColor_3,
                  ),
                  SizedBox(width: 5,),
                  Icon(Icons.access_time_outlined),
                ],
              ),
            ],
          ),
        ),
        itemCount: 6,
      ),
    );
  }
}