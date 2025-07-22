import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../images/custom_Images.dart';

class FooterStoreButtons extends StatelessWidget {
  const FooterStoreButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3.w,
      // runSpacing: 8.h,
      children: [
        _buildStoreButton("assets/images/apple.png"),
        _buildStoreButton("assets/images/google.png"),
        _buildStoreButton("assets/images/huawei.png"),
      ],
    );
  }

  Widget _buildStoreButton(String assetPath) {
    return Container(
      padding: EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: custom_Images_asset(image: assetPath, w: 25.w, h: 30.h),
    );
  }
}
