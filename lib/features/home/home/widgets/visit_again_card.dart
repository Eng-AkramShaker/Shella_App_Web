// import 'package:flutter/material.dart';
// import 'package:shella_design/common/util/app_colors.dart';
// import 'package:shella_design/common/util/custom_image.dart';
// import 'package:shella_design/common/util/lists.dart';
// import 'package:shella_design/features/home/domain/models/store_model.dart';

// class VisitAgainCard extends StatelessWidget {
//   final StoreModel store;
//   const VisitAgainCard({super.key, required this.store});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 15, bottom: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.white,
//               border: Border.all(
//                   color: Colors.white.withValues(alpha: 0.2), width: 1),
//               boxShadow: const [
//                 BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)
//               ]),
//           child: InkWell(
//             onTap: () {},
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Flexible(
//                     child: Text(
//                   store.name ?? '',
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 )),
//                 if (store.ratingCount! > 0)
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     Icon(Icons.star,
//                         size: 15, color: Theme.of(context).primaryColor),
//                     const SizedBox(width: 10),
//                     Text(store.avgRating!.toStringAsFixed(1)),
//                     const SizedBox(width: 5),
//                     Text("(${store.ratingCount})"),
//                   ]),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.storefront_outlined,
//                             size: 20, color: Theme.of(context).disabledColor),
//                         const SizedBox(width: 10),
//                         Flexible(
//                           child: Text(
//                             store.address ?? '',
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 1,
//                           ),
//                         ),
//                       ]),
//                 ),
//                 store.items != null
//                     ? Container(
//                         alignment: Alignment.center,
//                         height: 25,
//                         width: 200,
//                         child: ListView.builder(
//                           itemCount: store.items!.length,
//                           scrollDirection: Axis.horizontal,
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.only(right: 10),
//                               child: Stack(
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: CustomImage(
//                                       image:
//                                           '${store.items![index].imageFullUrl}',
//                                       fit: BoxFit.cover,
//                                       height: 25,
//                                       width: 25,
//                                     ),
//                                   ),
//                                   index == store.items!.length - 1
//                                       ? Positioned(
//                                           top: 0,
//                                           left: 0,
//                                           right: 0,
//                                           bottom: 0,
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               color: Colors.black
//                                                   .withValues(alpha: 0.5),
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                 (10),
//                                               ),
//                                             ),
//                                             child: Center(
//                                                 child: Text((store.itemCount! >
//                                                         20)
//                                                     ? '20+'
//                                                     : '${store.itemCount}')),
//                                           ))
//                                       : const SizedBox(),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                     : const SizedBox(),
//               ],
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//             height: 54,
//             width: 54,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.white,
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadiusGeometry.circular(12),
//               child: Stack(
//                 children: [
//                   CustomImage(
//                       image: store.logoUrl,
//                       fit: BoxFit.cover,
//                       height: 54,
//                       width: 54),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 30,
//           left: 10,
//           child: InkWell(
//             onTap: () {},
//             child: Icon(Icons.favorite, size: 20, color: AppColors.greenColor),
//           ),
//         ),
//       ],
//     );
//   }
// }
