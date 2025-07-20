import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/lists.dart';
import 'package:shella_design/features/home/home/widgets/category_Item.dart';
import 'package:shella_design/features/restaurant/widgets/mobile/category_card.dart';
import 'package:shella_design/features/restaurant/widgets/mobile/restaurant_discount_card.dart';

class Buildcategories extends StatelessWidget {
  const Buildcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        height: 260.h,
        child: Column(
          children: [
            Row(
              
              children: [
                RestaurantDiscountCard(
                topIcon: AppImages.percent,
                  description: "خصم 20% على منتجات مختارة",
                  urlAction: "عرض المنتجات",
                  
                  isUsed: false),
                 SizedBox(width: 10,),
                   RestaurantDiscountCard(
                  topIcon: AppImages.percent,
                  description: "خصم 10.00 ر س مع نقاط المكافآت",
                  bottomIcon: AppImages.done,
                  doneString: "تم تطبيقه",
                  
                  isUsed: true),
                                 SizedBox(width: 10,),
                   RestaurantDiscountCard(
                  topIcon: AppImages.percent,
                  description: "خصم 20% على منتجات مختارة",
                  urlAction: "عرض المنتجات",
                  
                  isUsed: false),
      
      
              ],
            ),
            SizedBox(height: 12.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: 
                
               categories.map((cat)=>CategoryCard(name: cat['name'] ,image: cat['image'],)).toList()
            )
                       
              
            
          ],
        ),
      ),
    );
  }
}