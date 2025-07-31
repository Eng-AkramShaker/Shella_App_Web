import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/features/home/controllers/banner_controller.dart';
import 'package:shella_design/features/home/home/widgets/banner_container_image_widget.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_custom_carousol_slider.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_shimmer_list_view.dart';
import 'package:shimmer/shimmer.dart';

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
        // List.generate(
        //   3,
        //   (index) {
        //     return Shimmer.fromColors(
        //       baseColor: Colors.grey[300]!, // Base color of the shimmer
        //       highlightColor:
        //           Colors.grey[100]!, // Highlight color of the shimmer
        //       child: Container(
        //         // Use provided height or let parent constrain
        //         decoration: BoxDecoration(
        //           color: Colors.white, // Placeholder color that shimmers
        //           borderRadius: BorderRadius.circular(10.0),
        //         ),
        //         margin: const EdgeInsets.symmetric(vertical: 2.0),
        //       ),
        //     );
        //   },
        // );
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
