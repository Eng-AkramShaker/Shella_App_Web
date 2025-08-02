import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/custom_image.dart';
import 'package:shella_design/common/widgets/errorWidget/error_text_widget.dart';
import 'package:shella_design/common/widgets/loading_progress/loading/green_loading_circle.dart';
import 'package:shella_design/features/search_filter/controller/product_provider.dart';

class BuildMostPopular extends StatefulWidget {
  const BuildMostPopular({super.key});

  @override
  State<BuildMostPopular> createState() => _BuildMostPopularState();
}

class _BuildMostPopularState extends State<BuildMostPopular> {
  @override
  void initState() {
    super.initState();
    // Fetch products when the widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProviderr>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProviderr>(
      builder: (context, productProvider, child) {
        // --- Handle Loading, Error, Empty States with fixed height ---
        if (productProvider.isLoading) {
          GreenLoadingCircle();
        } else if (productProvider.errorMessage != null) {
          return ErrorTextWidget(text: productProvider.errorMessage);
        } else if (productProvider.products.isEmpty) {
          return ErrorTextWidget(text: 'No popular products found.');
        }

        // --- If data is available, build the Horizontal ListView ---
        return SizedBox(
          height: 200
              .h, // *** Crucial: Define a fixed height for the horizontal ListView ***
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                horizontal: 1.w), // Using .w for horizontal padding

            children: [
              SizedBox(width: 10.w),

              // 2. Map product data to individual Card widgets
              ...productProvider.products.map((product) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 200,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 120,
                              width: 180,
                              child: CustomImage(image: product.image)),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                                child: Text(product.name,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(product.price.toString()),
                                  ],
                                ),
                                Container(
                                  height: 35,
                                  width: 38,
                                  decoration: BoxDecoration(
                                      color: AppColors.greenColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.add_shopping_cart_outlined,
                                      size: 20, color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      child: Icon(
                        Icons.favorite_outline,
                        color: AppColors.greenColor,
                      ),
                    ),
                  ],
                );
                // ignore: unnecessary_to_list_in_spreads
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
