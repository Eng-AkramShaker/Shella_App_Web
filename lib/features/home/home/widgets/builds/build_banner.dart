import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/home/controllers/banner_controller.dart';

Widget buildBanner(BuildContext context) {
  return Consumer<BannerProvider>(
    builder: (context, bannerProvider, child) {
      if (bannerProvider.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (bannerProvider.error != null) {
        return Center(
          child: Text(
            'حدث خطأ أثناء تحميل البانرات: ${bannerProvider.error}',
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
        children: [
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: bannerProvider.banners.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final banner = bannerProvider.banners[i];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    banner.imageFullUrl,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}
