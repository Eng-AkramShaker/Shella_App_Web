import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/loading/loading.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/controllers/orders_controller.dart';
import 'package:shella_design/features/orders/widgets/builds/build_list_view.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildLists(BuildContext context) {
  return Consumer<OrdersController>(
    builder: (context, ordersController, child) {
      if (ordersController.runningOrdersstate == OrderState.success) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              Custom_Text(context,
                  text: "مطاعم", style: font14Black600W(context)),
              buildListView(
                  orders: ordersController.runningOrders!.orders!,
                  context: context),
              Custom_Text(
                context,
                text: "سوبر ماركت",
                style: font14Black600W(context),
              ),
              buildListView(
                  orders: ordersController.historyOrders!.orders!,
                  context: context),
            ],
          ),
        );
      } else {
        return Loading(
          color: AppColors.greenColor,
        );
      }
    },
  );
}
