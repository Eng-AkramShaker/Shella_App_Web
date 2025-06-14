import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/domain/models/orders_model.dart';
import 'package:shella_design/features/orders/widgets/builds/build_order_card.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_navigators.dart';

Widget buildListView(
    {required List<OrderModel> orders, required BuildContext context}) {
  return Column(
    children: [
      (orders.isNotEmpty)
          ? ListView.builder(
              padding: EdgeInsets.only(bottom: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return InkWell(
                  onTap: () {
                    pushNewScreen(context, AppRoutes.step_one_service_screen);
                  },
                  child: buildOrderCard(order, context),
                );
              },
            )
          : Center(
              child: Custom_Text(
                context,
                text: "لا توجد طلبات ",
                style: font14Black600W(context),
              ),
            ),
    ],
  );
}
