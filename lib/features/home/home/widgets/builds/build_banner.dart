import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/home/controllers/banner_controller.dart';
import 'package:shella_design/features/home/home/widgets/banner_container_image_widget.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_custom_carousol_slider.dart';

Widget buildBanner(BuildContext context) {
  return Consumer<BannerProvider>(
    builder: (context, bannerProvider, child) {
      if (bannerProvider.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (bannerProvider.errorMessage != null) {
        return Center(
          child: Text(
            'حدث خطأ أثناء تحميل البانرات: ${bannerProvider.errorMessage}',
            style: const TextStyle(color: Colors.red),
          ),
        );
      }

      if (bannerProvider.banners.isEmpty) {
        return const Center(
          child: Text('لا توجد بانرات حالياً'),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildCustomCarousolSlider(
            itemCount: bannerProvider.banners.length,
            itemBuilder: (context, index, _) {
              final banner = bannerProvider.banners[index];
              return InkWell(
                onTap: () async {
                  print('Tapped on banner: ${banner.imageUrlFull}');
                },
                child:
                    BannerContainerImageWidget(imageUrl: banner.imageUrlFull!),
              );
            },
          ),
          const SizedBox(height: 2.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerProvider.banners.map((banner) {
              int index = bannerProvider.banners.indexOf(banner);
              int totalBanner = bannerProvider.banners.length;

              bool isActive = index == 0;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: isActive
                    ? Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 1),
                        child: Text('${(index) + 1}/$totalBanner',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12)),
                      )
                    : Container(
                        height: 5,
                        width: 6,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
              );
            }).toList(),
          ),
        ],
      );
    },
  );
}
