import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/features/restaurant/widgets/mobile/item_of_restaurant.dart';

class RestaurantItems extends StatelessWidget {
  const RestaurantItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
      children: [
        ItemOfRestaurant(title: "دبل تشيز برغر",description: "برغل لحم جبنة دبل,خس مخلل ,مايونيز,صوص تشيدر...",imageUrl: AppImages.burger,price: 50.0,),
        SizedBox(height: 12,),
        ItemOfRestaurant(title: "بباروني بيتزا",description: "جبنة,ذرة,فطر ,صلصة,سلامي,اوريغانو",imageUrl: AppImages.pizza,price: 30.0,),
      ],
      ),
    );
  }
}