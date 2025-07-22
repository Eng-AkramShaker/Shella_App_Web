import 'package:flutter/material.dart';
import 'package:shella_design/features/orders/screens/order_screen/mobile_orders_screen.dart';

import 'package:shella_design/common/helper/responsive_helper.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileBody: MobileOrders_Screen());
  }
}
