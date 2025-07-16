import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/helper/grid_view_fix_height.dart';
import 'package:shella_design/common/util/app_colors.dart';
import '../../../common/util/app_styles.dart';

class MostPurchasedProducts extends StatelessWidget {
  const MostPurchasedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المنتجات الأكثر شراء',
          style: font14Black400W(context),
        ),
        SizedBox(
          height: 16.h,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 5.0.h, // Spacing between columns
              mainAxisSpacing: 5.0.w, // Spacing between rows
              height: 180.h),
          itemCount: products.length, // Total number of products
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        )
      ],
    );
  }
}

class Product {
  final String image;
  final String name;
  final double price;
  final double discountPrice;

  Product({required this.image, required this.name, required this.price, required this.discountPrice});
}

final List<Product> products = [
  Product(
    image: 'assets/images/b2.png',
    name: 'ليبتون 48 ظرف',
    price: 10.0,
    discountPrice: 10.0,
  ),
  Product(image: 'assets/images/b1.png', name: 'داجستيف بسكويت', price: 15.0, discountPrice: 15.0),
  // Add more products here
];

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
      child: Card(
        color: AppColors.gryColor_3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(
                product.image,
                height: 100, // Adjust image height as needed
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    child: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: font10Black400W(context),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: font13Black400W(context).copyWith(decoration: TextDecoration.lineThrough),
                      ),
                      Spacer(),
                      Text(
                        '\$${product.discountPrice.toStringAsFixed(2)}',
                        style: font13SecondaryColor400W(context),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
