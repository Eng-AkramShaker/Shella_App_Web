import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    super.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    this.icon,
    this.color,
    required this.onPressed,
  });

  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;
  final IconData? icon;
  final Color? color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      width: width,
      height: height,
      child: SizedBox(
        height: 32,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.backgroundColor,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            child: Row(
              children: [
                Custom_Text(
                  context,
                  text: "مساعدة",
                  style: font10Black400W(context, size: size_10(context)),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  child: custom_Images_asset(image: AppImages.help, h: 18, w: 18),
                ),
              ],
            ),
            // ),
          ),
        ),
      ),
    );
  }
}
