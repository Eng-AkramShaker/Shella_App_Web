import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/custom_image.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/search_filter/controller/product_provider.dart';

// Assuming you have a Product model like this:
// class Product {
//   final String id;
//   final String name;
//   final String image;
//
//   Product({required this.id, required this.name, required this.image});
// }

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
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        // --- Handle Loading, Error, Empty States with fixed height ---
        if (productProvider.isLoading) {
          return SizedBox(
            height: 150.h, // Fixed height for the loader area
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (productProvider.errorMessage != null) {
          return SizedBox(
            height: 150.h, // Fixed height for the error message area
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Error: ${productProvider.errorMessage}'),
              ),
            ),
          );
        } else if (productProvider.products.isEmpty) {
          return SizedBox(
            height: 150.h, // Fixed height for the no products message area
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('No popular products found.'),
              ),
            ),
          );
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
              // 1. "الاكثر بحثا" text as the first item
              // SizedBox(
              //   width: 100
              //       .w, // *** Crucial: Define a fixed width for this child ***
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 10.w),
              //     child: Center(
              //       child: Custom_Text(
              //         context,
              //         text: "الاكثر بحثا",
              //         style: font10Grey400W(context, size: size_10(context)),
              //       ),
              //     ),
              //   ),
              // ),

              // Add a SizedBox for spacing between the text and the first product card
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
                // return Card(
                //   margin: EdgeInsets.symmetric(
                //       horizontal: 8.0.w, vertical: 4.0.h), // Responsive margins
                //   elevation: 4.0,
                //   // *** Crucial: Define a fixed width for each Card's content ***
                //   child: SizedBox(
                //     width: 250
                //         .w, // Example width for each product card. Adjust as needed.
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Row(
                //         crossAxisAlignment:
                //             CrossAxisAlignment.start, // Align content to top
                //         children: [
                //           // Image container with explicit width and height
                //           product.image.isNotEmpty
                //               ? SizedBox(
                //                   width: 80.w,
                //                   height: 80.h,
                //                   child: Image.network(
                //                     product.image,
                //                     fit: BoxFit.cover,
                //                     errorBuilder: (context, error, stackTrace) {
                //                       return const Icon(Icons.broken_image,
                //                           size: 40);
                //                     },
                //                   ),
                //                 )
                //               : SizedBox(
                //                   width: 80.w,
                //                   height: 80.h,
                //                   child: const Icon(Icons.image_not_supported,
                //                       size: 40),
                //                 ),
                //           SizedBox(width: 16.0.w), // Horizontal spacing
                //           Expanded(
                //             // Takes remaining space within the SizedBox(width: 250.w)
                //             child: Custom_Text(
                //               context,
                //               text: product.name,
                //               style: font10Black600W(context,
                //                   size: size_14(context)),
                //               maxLines: 2,
                //               // overflow: TextOverflow.ellipsis, // Ensure text truncates
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
