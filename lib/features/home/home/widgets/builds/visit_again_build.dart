import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/custom_image.dart';
import 'package:shella_design/features/home/controllers/section_controller.dart';
import 'package:shella_design/features/home/controllers/store_controller.dart';

Widget visitAgainBuild(BuildContext context) {
  final storeProvider = Provider.of<StoreProvider>(context);
  final stores = storeProvider.stores;
  if (storeProvider.isLoading) {
    Provider.of<SectionProvider>(context).fetchCategories();
    return const Center(child: CircularProgressIndicator());
  }

  if (stores.isEmpty) {
    return const Center(child: Text('No stores available'));
  }
  return Stack(
    children: [
      Container(
        height: 150,
        width: double.infinity,
        color: AppColors.greenColor,
        child: Column(
          children: [
            Text('Visit Again',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              'ComE VIsist Again',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: stores.length,
                itemBuilder: (context, index, realIndex) {
                  return Column(
                    children: [
                      Container(
                        height: 60,
                        width: 80,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.red),
                        child: CustomImage(image: stores[index].logoUrl),
                      ),
                      const SizedBox(height: 10),
                      Consumer<SectionProvider>(
                        builder: (context, provider, _) {
                          return Text(provider.categories[index].name);
                        },
                      ),
                    ],
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  disableCenter: true,
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
