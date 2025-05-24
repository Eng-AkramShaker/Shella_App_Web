import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../../../../common/util/app_colors.dart';

class RateBar extends StatelessWidget {
  const RateBar({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 5,
      minRating: 1,
      direction: Axis.horizontal,
      ignoreGestures: true,
      itemCount: itemCount,
      itemSize: 15,
      itemPadding: EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => Icon(
        Icons.star_border,
        color: AppColors.orangeColor,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
