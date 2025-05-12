import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/customer_service_button.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/delivery_status_header.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/delivery_time_info.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/help_button.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/order_details_widget.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/order_tracking_overlay.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/stages_order_widget.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/widget/toggle_buttons_section.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_navigators.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({super.key});

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool _showOverlay = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          custom_Images_asset(
            image: AppImages.map,
            w: double.infinity,
            h: double.infinity,
          ),
          Positioned(
              top: 30,
              right: 20,
              child: IconButtonCircle(
                height: 30,
                width: 30,
                iconsize: 20,
                onPressed: () {
                  popRoute(context);
                },
                icon: Icons.arrow_back_ios_rounded,
                iconcolor: AppColors.bgColor,
              )),
          HelpButton(top: 35, left: 20, onPressed: () {}),
          _buildContentSection(),
          OrderTrackingOverlay(
            showOverlay: _showOverlay,
            onClose: () => setState(() => _showOverlay = false),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    return Positioned(
      top: 300,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: AppColors.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DeliveryStatusHeader(),
                const SizedBox(height: 10),
                StagesOrderWidget(),
                const DeliveryTimeInfo(),
                const SizedBox(height: 10),
                ToggleButtonsSection(
                  onTap1: () => setState(() => isPressed1 = !isPressed1),
                  onTap2: () => setState(() => isPressed2 = !isPressed2),
                  isPressed1: isPressed1,
                  isPressed2: isPressed2,
                ),
                const SizedBox(height: 10),
                OrderDetailsWidget(),
                const SizedBox(height: 10),
                CustomerServiceButton(onPressed: () {}),
                const SizedBox(height: 20),
                custom_Images_asset(
                  image: AppImages.discount,
                  fit: BoxFit.fill,
                  w: MediaQuery.of(context).size.width,
                  h: 125,
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
