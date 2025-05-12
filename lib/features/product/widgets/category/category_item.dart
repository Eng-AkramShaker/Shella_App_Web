import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';
import '../../../../common/widgets/images/custom_Images.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;
  final double? h;
  final double? w;
  const CategoryItem({super.key, required this.image, required this.label, this.h, this.w});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          custom_Images_asset(image: image, h: h ?? 100, w: w ?? 100),
          Custom_Text(context, text: label, style: font11Grey400W(context)),
        ],
      ),
    );
  }
}
