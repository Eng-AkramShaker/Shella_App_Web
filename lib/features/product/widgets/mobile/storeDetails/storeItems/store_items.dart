import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/product/controllers/product_controller.dart';

class StoreItems extends StatelessWidget {
  const StoreItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.69,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(10),child: SizedBox(height: height(context, 0.14),child: Image.network(ProductController.get(context).storeDetailsModel!.categoryDetails![index].imageFullUrl??'',fit: BoxFit.fill,errorBuilder: (context, error, stackTrace) => SizedBox(),))),
            SizedBox(height: 5,),
            Custom_Text(context, text: ProductController.get(context).storeDetailsModel!.categoryDetails![index].name??'')
          ],
        );
      },
      itemCount: ProductController.get(context).storeDetailsModel!.categoryDetails!.length,
    );
  }
}