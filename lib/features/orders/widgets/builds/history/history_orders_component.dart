import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/orders/controllers/orders_controller.dart';
import 'package:shella_design/features/orders/widgets/builds/history/history_paginated_order_list.dart';

Widget historyOrdersComponent(BuildContext context) {
  return Consumer<OrdersController>(
    builder: (context, ordersController, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          // Custom_Text(context, text: "مطاعم", style: font14Black600W(context)),
          Expanded(child: HistoryPaginatedOrderList()),
          // Custom_Text(
          //   context,
          //   text: "سوبر ماركت",
          //   style: font14Black600W(context),
          // ),
          // Expanded(child: RunningPaginatedOrderList()),
        ],
      );
    },
  );
}
