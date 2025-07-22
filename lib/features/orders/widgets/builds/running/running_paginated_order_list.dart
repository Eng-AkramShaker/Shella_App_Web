import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/loading_progress/loading/loading.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/controllers/orders_controller.dart';
import 'package:shella_design/features/orders/widgets/builds/build_order_card.dart';

class RunningPaginatedOrderList extends StatefulWidget {
  const RunningPaginatedOrderList({super.key});

  @override
  State<RunningPaginatedOrderList> createState() =>
      _RunningPaginatedOrderListState();
}

class _RunningPaginatedOrderListState extends State<RunningPaginatedOrderList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final provider = OrdersController.get(context, listen: false);

      final currentLength = provider.runningOrders?.orders?.length ?? 0;
      final total = provider.runningOrders?.totalSize ?? 0;
      final isLoadMoreInProgress =
          provider.loadMoreRunningState == OrderState.loading;

      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoadMoreInProgress &&
          currentLength < total) {
        provider.loadMoreRunningOrders();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersController>(
      builder: (context, ordersController, _) {
        final orders = ordersController.runningOrders?.orders ?? [];

        if (ordersController.runningOrdersstate == OrderState.loading) {
          return const Center(
              child: Loading(
            color: AppColors.primaryColor,
          ));
        }

        if (orders.isEmpty) {
          return Center(
            child: Custom_Text(
              context,
              text: "لا توجد طلبات",
              style: font14Black600W(context),
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 10),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return InkWell(
                    onTap: () {
                      nav.push(AppRoutes.orderdetails);
                    },
                    child: buildOrderCard(order, context),
                  );
                },
              ),
            ),
            (ordersController.loadMoreRunningState == OrderState.loading)
                ? Loading(
                    color: AppColors.primaryColor,
                  )
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
