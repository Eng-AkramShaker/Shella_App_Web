import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/my_points/controllers/my_points_controller.dart';

class LoyaltyCardWidget extends StatelessWidget {
  const LoyaltyCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final points = context.watch<LoyaltyProvider>().user?.loyaltyPoint ?? 0;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).disabledColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //here i replaced the loyalty image with the logo image
              Image.asset(AppImages.loyal, height: 60, width: 60),
              const SizedBox(width: 20),
              Text(
                '$points',
                style: font18Black700W(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}