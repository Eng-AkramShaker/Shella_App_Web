import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/controller/start_tracking_order_controller.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';

class TimeLeftWidget extends StatelessWidget {
  const TimeLeftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final startTrackingOrderController =
        Provider.of<StartTrackingOrderController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryyellow200,
        ),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Custom_Text(context,
                text: "وقت الوصول المتوقع",
                style: TextStyle(
                    color: AppColors.secondaryyellow800,
                    fontWeight: FontWeight.w400,
                    fontSize: size_14(context))),
            SizedBox(width: 5),
            Custom_Text(context,
                text:
                    "${startTrackingOrderController.time1} - ${startTrackingOrderController.time2}",
                style: TextStyle(
                    color: AppColors.secondaryyellow800,
                    fontWeight: FontWeight.w700,
                    fontSize: size_14(context))),
          ],
        ),
      ),
    );
  }
}
