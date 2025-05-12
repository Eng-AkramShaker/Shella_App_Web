import 'package:flutter/material.dart';
import 'package:shella_design/features/orders/widgets/builds/build_order_card.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_navigators.dart';

Widget buildListView({required List<Map<String, dynamic>> items}) {
  return Column(
    children: [
      ListView.builder(
        padding: EdgeInsets.only(bottom: 10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              pushNewScreen(context, AppRoutes.step_one_service_screen);
            },
            child: buildOrderCard(items[index], context),
          );
        },
      ),
    ],
  );
}
