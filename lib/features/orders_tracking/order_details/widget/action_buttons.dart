import 'package:flutter/material.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/screen/order_tracking.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        custom_Button(
          h: 35,
          w: 120,
          context,
          title: "تتبع الطلب",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderTracking(),
                ));
          },
          style: font10White400W(context, size: size_16(context)),
        ),
        custom_Button(
          h: 35,
          w: 120,
          context,
          buttoncolor: AppColors.backgroundColor,
          title: "ألغاء الطلب",
          onPressed: () {},
          style: font12Green400W(context, size: size_16(context)),
        ),
      ],
    );
  }
}
