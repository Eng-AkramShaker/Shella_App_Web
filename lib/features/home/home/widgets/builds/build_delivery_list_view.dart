import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/custom_image.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/home/controllers/store_controller.dart';
import 'package:shella_design/features/product/screens/product_screen.dart';

Widget buildDeliveryListView(BuildContext context) {
  final storeProvider = Provider.of<StoreProvider>(context);

  if (storeProvider.isLoading) {
    return const Center(child: CircularProgressIndicator());
  }

  final stores = storeProvider.stores;

  if (stores.isEmpty) {
    return const Center(child: Text('No stores available'));
  }

  return SizedBox(
    width: width_media(context),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stores.length,
      itemBuilder: (context, index) {
        final store = stores[index];

        return Stack(
          children: [
            InkWell(
              onTap: () async {
                await storeProvider.fetchCategories(store.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductView(
                      store: store,
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: custom_Images_asset(
                              image: store.coverPhotoUrl,
                              h: 100,
                              w: width_media(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Custom_Text(
                                  context,
                                  text: store.name,
                                  style: font14Black500W(context, lineHeight: 2.5),
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Custom_Text(
                                //       context,
                                //       text: store.name,
                                //       style: font14Black500W(context, lineHeight: 2.5),
                                //     ),
                                //     Row(
                                //       children: [
                                //         custom_Images_asset(
                                //           image: AppImages.icon_Star,
                                //           h: 18,
                                //           w: 18,
                                //         ),
                                //         const SizedBox(width: 4),
                                //         Custom_Text(
                                //           context,
                                //           text: '4.8 (50)',
                                //           style:
                                //               font14Grey400W(context, lineHeight: 2.5),
                                //         ),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined, color: Colors.green, size: 15),
                                    Custom_Text(context, text: store.address, style: font10Grey400W(context)),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(children: [
                                  custom_Images_asset(
                                    image: MainAppConstants.distanceLine,
                                    h: 18,
                                    w: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${store.distance! > 100 ? '100+' : store.distance?.toStringAsFixed(2)} ${'كم'}',
                                    style: robotoBold.copyWith(color: Theme.of(context).primaryColor, fontSize: 10),
                                  ),
                                  const SizedBox(width: 10),
                                  Text('منك', style: robotoRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: 10)),
                                  Spacer(),
                                  Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.greenColor),
                                    child: Center(
                                        child: Text(
                                      'تسوق الان',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    )),
                                  ),
                                ]),

                                // Custom_Text(
                                //   context,
                                //   text: store.module!.moduleType ?? "",
                                //   style: font10Grey400W(context),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(vertical: 8),
                                //   child: Row(
                                //     children: [
                                //       custom_Images_asset(
                                //         image: AppImages.icon_time,
                                //         h: 18,
                                //         w: 18,
                                //       ),
                                //       const SizedBox(width: 8),
                                //       Custom_Text(
                                //         context,
                                //         text:
                                //             '${store.deliveryTime} - ${store.delivery ? MainAppConstants.availableDelivery : MainAppConstants.noDelivery}',
                                //         style: font10Grey400W(context),
                                //       ),
                                //       const SizedBox(width: 8),
                                //       const Icon(
                                //         Icons.delivery_dining,
                                //         color: AppColors.secondaryColor,
                                //         size: 20,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Row(
                                //   children: [
                                //     custom_Images_asset(
                                //       image: AppImages.icon_disc,
                                //       h: 18,
                                //       w: 18,
                                //     ),
                                //     const SizedBox(width: 8),
                                //     Custom_Text(
                                //       context,
                                //       text: MainAppConstants.discount25FirstOrder,
                                //       style: font10Grey400W(context),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 15,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CustomImage(
                                image: stores[index].logoUrl, fit: BoxFit.cover, height: double.infinity, width: double.infinity),
                          ),
                        ),
                        //           store.avgrating! > 0 ? Positioned(
                        //   bottom: -5, right: 5, left: 5,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Theme.of(context).cardColor,
                        //       borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                        //       boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
                        //     ),
                        //     child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        //       Text(store.avgRating!.toStringAsFixed(1), style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                        //       const SizedBox(width: 3),

                        //       Icon(Icons.star, color: Theme.of(context).primaryColor, size: 15),
                        //     ]),
                        //   ),
                        // ) : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );
}
