import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

class RestaurantItem extends StatelessWidget {
  final String image;

  const RestaurantItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.wtColor,
      radius: 27,
      child: ClipRRect(borderRadius: BorderRadius.circular(5),child: Image.network(image,errorBuilder: (context, error, stackTrace) => SizedBox(),)),
    );
  }
}