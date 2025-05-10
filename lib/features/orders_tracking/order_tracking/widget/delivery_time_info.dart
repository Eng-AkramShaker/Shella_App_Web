import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

class DeliveryTimeInfo extends StatelessWidget {
  const DeliveryTimeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final orderTrackingController =
        Provider.of<OrderTrackingController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(
          context,
          text: "وقت الوصول المتوقع",
          style: font10Black400W(context, size: size_11(context)),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Custom_Text(
              context,
              text:
                  "${orderTrackingController.expectedTime1} - ${orderTrackingController.expectedTime2}",
              style: font11Black500W(context, size: size_14(context)),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.gryColor_5,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Custom_Text(
                context,
                color: AppColors.backgroundColor,
                text: orderTrackingController.deliveryTime,
                style: font10White400W(context, size: size_11(context)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Custom_Text(
              context,
              text: "الوقت الاصلي:",
              style: font10Black400W(context, size: size_11(context)),
            ),
            SizedBox(width: 5),
            Custom_Text(
              context,
              text:
                  "${orderTrackingController.realTime1} - ${orderTrackingController.realTime2}",
              style: font12Green400W(context, size: size_11(context)),
              color: AppColors.primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
