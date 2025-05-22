import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/home/controllers/store_controller.dart';
import 'package:shella_design/features/product/screens/product_screen.dart';

Widget buildDeliveryListView(BuildContext context) {
  final storeProvider = Provider.of<StoreProvider>(context);

  if (storeProvider.isLoading) {
    return Center(child: CircularProgressIndicator());
  }

  final stores = storeProvider.stores;

  return Container(
    width: width_media(context),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: stores.length,
          itemBuilder: (context, index) {
            final store = stores[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductView(store: store),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width_media(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          custom_Images_asset(
                              image: store.coverPhotoUrl,
                              h: 180,
                              w: width_media(context)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Custom_Text(context,
                                        text: store.name,
                                        style: font14Black500W(context,
                                            lineHeight: 2.5)),
                                    Row(
                                      children: [
                                        custom_Images_asset(
                                            image: AppImages.icon_Star,
                                            h: 18,
                                            w: 18),
                                        Custom_Text(context,
                                            text: ' 4.8 (50)',
                                            style: font14Grey400W(context,
                                                lineHeight: 2.5)),
                                      ],
                                    ),
                                  ],
                                ),
                                Custom_Text(context,
                                    text: store.address,
                                    style: font10Grey400W(context)),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      custom_Images_asset(
                                          image: AppImages.icon_time,
                                          h: 18,
                                          w: 18),
                                      SizedBox(width: 8),
                                      Custom_Text(context,
                                          text:
                                              '${store.deliveryTime} - ${store.delivery ? "توصيل متاح" : "لا يوجد توصيل"}',
                                          style: font10Grey400W(context)),
                                      Icon(Icons.delivery_dining,
                                          color: AppColors.secondaryColor,
                                          size: 20),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    custom_Images_asset(
                                        image: AppImages.icon_disc,
                                        h: 18,
                                        w: 18),
                                    SizedBox(width: 8),
                                    Custom_Text(context,
                                        text: 'خصم يصل إلى 25% عند اول طلب',
                                        style: font10Grey400W(context)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}
