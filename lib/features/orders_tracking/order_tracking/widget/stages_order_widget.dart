import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/builds/build_dynamic_divider.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/builds/build_stage_icon.dart';

class StagesOrderWidget extends StatelessWidget {
  const StagesOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OrderTrackingController>(context);

    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: buildStageIcon(
                  Icons.menu,
                  1,
                  controller,
                ),
              ),
              buildDynamicDivider(context, "تم ارسال طلبك للمطعم"),
              Expanded(
                child: buildStageIcon(
                  Icons.coffee_outlined,
                  2,
                  controller,
                ),
              ),
              buildDynamicDivider(context, "المطعم يقوم بتحضير الطلب"),
              Expanded(
                child: buildStageIcon(
                  Icons.directions_car,
                  3,
                  controller,
                ),
              ),
              buildDynamicDivider(context, "السائق في طريقه اليك"),
              Expanded(
                child: buildStageIcon(
                  Icons.account_circle_outlined,
                  3,
                  controller,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
