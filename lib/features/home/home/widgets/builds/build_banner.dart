import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/home/controllers/banner_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              disableCenter: true,
              viewportFraction: 0.8,
              autoPlayInterval: const Duration(seconds: 7),
              onPageChanged: (index, reason) {
                // يمكنك إضافة منطق لتحديث مؤشر الصفحة هنا إذا لزم الأمر، ولكن ليس له علاقة بـ GetX
                // مثلاً، إذا كان لديك متغير حالة محلي للمؤشر
              },
            ),
            itemCount:
                bannerProvider.banners.length, // استخدام البيانات من البروفايدر
            itemBuilder: (context, index, _) {
              final banner = bannerProvider.banners[index];
              return InkWell(
                onTap: () async {
                  // هنا يمكنك إضافة منطق التنقل إذا كان ذلك مطلوبًا،
                  // ولكن يجب أن يكون منفصلاً عن GetX أو API Calls مباشرة هنا.
                  // على سبيل المثال، يمكنك تمرير الـ banner إلى صفحة جديدة.
                  print('Tapped on banner: ${banner.imageUrlFull}');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(
                        10.0), // استبدال Dimensions.radiusDefault بقيمة ثابتة أو تعريفها
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12, blurRadius: 5, spreadRadius: 0)
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical:
                          2.0), // استبدال Dimensions.paddingSizeExtraSmall
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10.0), // استبدال Dimensions.radiusDefault
                    child: Image.network(
                      banner.imageUrlFull!, // استخدام الصورة من BannerModel
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.broken_image));
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
              height: 2.0), // استبدال Dimensions.paddingSizeExtraSmall
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerProvider.banners.map((banner) {
              int index = bannerProvider.banners.indexOf(banner);
              int totalBanner = bannerProvider.banners.length;

              // يمكنك استخدام حالة محلية لتحديد المؤشر النشط بدلاً من GetX
              // For demonstration, let's assume the first banner is always "active"
              bool isActive =
                  index == 0; // يمكنك تغيير هذا المنطق بناءً على حاجتك

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: isActive
                    ? Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(
                                10.0)), // استبدال Dimensions.radiusDefault
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 1),
                        child: Text('${(index) + 1}/$totalBanner',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12)), // استبدال robotoRegular
                      )
                    : Container(
                        height: 5,
                        width: 6,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(
                                10.0)), // استبدال Dimensions.radiusDefault
                      ),
              );
            }).toList(),
          ),
        ],
      );

      // return Column(
      //   children: [
      //     SizedBox(
      //       height: 120,
      //       child: ListView.separated(
      //         scrollDirection: Axis.horizontal,
      //         padding: const EdgeInsets.symmetric(horizontal: 8),
      //         itemCount: bannerProvider.banners.length,
      //         separatorBuilder: (_, __) => const SizedBox(width: 8),
      //         itemBuilder: (_, i) {
      //           final banner = bannerProvider.banners[i];
      //           return ClipRRect(
      //             borderRadius: BorderRadius.circular(8),
      //             child: Image.network(
      //               banner
      //                   .imageUrlFull!, // Now it's safe to use '!' because nulls are filtered out
      //               fit: BoxFit.cover,
      //               errorBuilder: (context, error, stackTrace) {
      //                 // This builder is for network errors (e.g., image not found at URL),
      //                 // not for null URLs, as those are already filtered.
      //                 return Container(
      //                   height: 150,
      //                   color: Colors.grey[300],
      //                   child: const Center(
      //                     child: Icon(Icons.broken_image,
      //                         size: 50, color: Colors.grey),
      //                   ),
      //                 );
      //               },
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // );
    },
  );
}
