// item widgets
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';

class Coustom_Item extends StatelessWidget {
  final String image;
  final String label;

  const Coustom_Item({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        custom_Images_asset(image: image, h: 75.h, w: 75.w),
        SizedBox(height: 6),
        Custom_Text(context, text: label, style: font11Grey400W(context)),
      ],
    );
  }
}
