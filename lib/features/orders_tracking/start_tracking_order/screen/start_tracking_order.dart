import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button_2.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/success_icon.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/widget/time_left_widget.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/widget/tracking_text.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class StartTrackingOrder extends StatelessWidget {
  const StartTrackingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(backgroundColor: AppColors.backgroundColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              custom_Images_asset(
                image: AppImages.order2,
                h: 300,
                w: 300,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 10),
              const SuccessIcon(iconPath: AppImages.mark),
              const SizedBox(height: 10),
              const TrackingText(
                mainText: "تم استلام الطلب",
                subText: "الطلب الخاص بك في الطريق",
              ),
              const SizedBox(height: 10),
              TimeLeftWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: custom_Button(
                  style: font12White500W(context, size: size_22(context)),
                  context,
                  h: 50,
                  title: "تتبع الطلب",
                  onPressed: () {
                    nav.push(AppRoutes.order_tracking);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
