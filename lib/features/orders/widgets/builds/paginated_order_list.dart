import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/loading/loading.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/controllers/orders_controller.dart';
import 'package:shella_design/features/orders/widgets/builds/build_order_card.dart';

class PaginatedOrderList extends StatefulWidget {
  const PaginatedOrderList({super.key});

  @override
  State<PaginatedOrderList> createState() => _PaginatedOrderListState();
}

class _PaginatedOrderListState extends State<PaginatedOrderList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    final orderProvider = OrdersController.get(context, listen: false);

    if (orderProvider.runningOrders == null ||
        orderProvider.runningOrders!.orders!.isEmpty) {
      orderProvider.getrunningOrders();
    }

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
      builder: (context, provider, _) {
        final orders = provider.runningOrders?.orders ?? [];
        final isInitialLoading =
            provider.runningOrdersstate == OrderState.loading ||
                provider.runningOrdersstate == OrderState.initial;
        final isLoadMoreLoading =
            provider.loadMoreRunningState == OrderState.loading;

        if (orders.isEmpty && isInitialLoading) {
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
                      pushNewScreen(context, AppRoutes.orderdetails);
                    },
                    child: buildOrderCard(order, context),
                  );
                },
              ),
            ),
            (isLoadMoreLoading)
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
