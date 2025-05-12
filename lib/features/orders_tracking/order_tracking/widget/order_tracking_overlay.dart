import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';

class OrderTrackingOverlay extends StatelessWidget {
  final bool showOverlay;
  final VoidCallback onClose;

  const OrderTrackingOverlay({
    super.key,
    required this.showOverlay,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    if (!showOverlay) return const SizedBox.shrink();

    return Positioned.fill(
      child: Container(
        color: AppColors.bgColor.withValues(alpha: 0.6),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: custom_Images_asset(image: AppImages.shella, h: 400, w: double.infinity),
              )),
            ),
            Positioned(
                top: MediaQuery.of(context).padding.top + 70,
                left: 10,
                child: IconButtonCircle(
                  onPressed: onClose,
                  icon: Icons.close,
                  height: 18,
                  width: 18,
                  iconsize: 15,
                )),
          ],
        ),
      ),
    );
  }
}
