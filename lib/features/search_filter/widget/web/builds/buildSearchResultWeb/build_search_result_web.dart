import 'package:flutter/material.dart';
import 'package:shella_design/features/search_filter/widget/web/builds/buildSearchResultWeb/searchResultFilterWeb/search_result_filter_web.dart';
import '../../../../../../common/widgets/gap/height/height.dart';
import '../../../../../../common/widgets/gap/width/width.dart';
import 'searchResultContainerWeb/search_result_container_web.dart';

class BuildSearchResultWeb extends StatelessWidget {
  const BuildSearchResultWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context,0.55),
      child: Column(
        children: [
          SearchResultFilterWeb(),
          SizedBox(height: 10,),
          SizedBox(
            height: height(context,0.73),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15,childAspectRatio: 1.1),
              itemBuilder: (context, index) => SearchResultContainerWeb(
                itemImg: 'https://th.bing.com/th/id/OIP.MO6T-LKR9oi03dJSe9DMGgHaE8?cb=iwp2&rs=1&pid=ImgDetMain',
                itemName: 'مطعم الشرق',
                rate: '4.5',
                location: 'الرياض , حي النخيل',
                deliveryTime: 'يصل خلال 30-45 دقيقة',
                storeOffer: 'يبدأ من 25 ريال',
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}