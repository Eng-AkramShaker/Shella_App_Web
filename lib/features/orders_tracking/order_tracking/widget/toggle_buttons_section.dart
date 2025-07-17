import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/toggle_button_widget.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ToggleButtonsSection extends StatelessWidget {
  final Function() onTap1;
  final Function() onTap2;
  final bool isPressed1;
  final bool isPressed2;
  const ToggleButtonsSection(
      {super.key, required this.onTap1, required this.onTap2, required this.isPressed1, required this.isPressed2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ToggleButtonWidget(
          isPressed: isPressed1,
          icon: Icons.notifications_none,
          label: "تذكير سائق التوصيل",
          style: font10Black400W(context, size: size_11(context)),
          onTap: onTap1,
        ),
        const SizedBox(height: 10),
        ToggleButtonWidget(
          isPressed: isPressed2,
          icon: Icons.disabled_by_default_outlined,
          label: "قم بتفعيل الاشعارات لتلقي كافة التحديثات بخصوص طلبك  بدء",
          style: font10Black400W(context, size: size_10(context)),
          onTap: onTap2,
        ),
      ],
    );
  }
}
