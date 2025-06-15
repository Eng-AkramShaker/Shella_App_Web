// import 'package:flutter/material.dart';
// import 'package:shella_design/features/product/controllers/product_controller.dart';
// import 'package:shella_design/features/product/controllers/product_controller.dart';
// import 'package:shella_design/features/product/controllers/product_controller.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../../../../../../common/util/app_colors.dart';
// import '../../../../../../common/widgets/gap/height/height.dart';
//
// class StoreDetailsBanners extends StatelessWidget {
//   const StoreDetailsBanners({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         SizedBox(
//           height: height(context, 0.13),
//           child: PageView.builder(
//             controller: controller,
//             itemBuilder: (context, index) => Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 7),
//               child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(ProductController.get(context).homeBannersModel!.banners![index].imageFullUrl??'',fit: BoxFit.fill,errorBuilder: (context, error, stackTrace) => SizedBox(),)),
//             ),
//             itemCount: ProductController.get(context).homeBannersModel!.banners!.length,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 7),
//           child: SmoothPageIndicator(
//               controller: controller!,
//               count: ProductController.get(context).homeBannersModel!.banners!.length,
//               effect: WormEffect(
//                 activeDotColor: AppColors.gold,
//                 dotColor: AppColors.gryColor_3,
//                 dotHeight: 8,
//                 dotWidth: 8,
//               )
//           ),
//         )
//       ],
//     );
//   }
// }