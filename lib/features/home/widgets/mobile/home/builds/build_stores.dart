import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import '../../../../controllers/home_controller.dart';

class BuildStores extends StatelessWidget {
  const BuildStores({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(HomeController.get(context).storesModel!.stores!.length, (index) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            SizedBox(
              width: width(context, 1),
              child: Card(
                color: AppColors.wtColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  child: Image.network(HomeController.get(context).storesModel!.stores![index].logoFullUrl??'',height: height(context, 0.13),errorBuilder: (context, error, stackTrace) => SizedBox(),),
                )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Custom_Text(context, text: HomeController.get(context).storesModel!.stores![index].name??'',size: 15),
                      Spacer(),
                      Icon(Icons.star,color: AppColors.gold,size: 20,),
                      Custom_Text(context, text: HomeController.get(context).storesModel!.stores![index].ratingCount.toString(),size: 14,color: AppColors.gryColor_2),
                      SizedBox(width: 3,),
                      Custom_Text(context, text: '(${HomeController.get(context).storesModel!.stores![index].reviewsCount})',size: 14),
                    ],
                  ),
                  Custom_Text(context, text: HomeController.get(context).storesModel!.stores![index].slug??'',size: 12),
                ],
              ),
            )
          ],
        ),
      ),),
    );
  }
}
