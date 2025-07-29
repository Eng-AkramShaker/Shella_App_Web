// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shella_design/common/util/app_colors.dart';
// import 'package:shella_design/features/home/controllers/store_controller.dart';
// import 'package:shella_design/features/home/home/widgets/visit_again_card.dart';

// class VisitAgainView extends StatefulWidget {
//   const VisitAgainView({super.key});

//   @override
//   State<VisitAgainView> createState() => _VisitAgainViewState();
// }

// class _VisitAgainViewState extends State<VisitAgainView> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context.read<StoreProvider>().fetchStores();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final storeProvider = Provider.of<StoreProvider>(context);
//     final stores = storeProvider.stores;
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           color: AppColors.greenColor,
//           height: 180,
//           width: double.infinity,
//         ),
//         Padding(
//           padding: EdgeInsetsGeometry.only(top: 10),
//           child: Column(
//             children: [
//               Text('Visit again'),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text('get your recent purache'),
//               const SizedBox(height: 10),
//               CarouselSlider.builder(
//                 itemCount: stores.length,
//                 options: CarouselOptions(
//                   aspectRatio: 2.0,
//                   enlargeCenterPage: true,
//                   disableCenter: true,
//                 ),
//                 itemBuilder: (context, index, realIndex) {
//                   return VisitAgainCard(store: stores[index]);
//                 },
//               ),
//             ],
//           ),
//         ),
//         // Positioned(
//         //   top: 20,
//         //   left: 10,
//         //   child: ,
//         // ),
//       ],
//     );
//   }
// }
