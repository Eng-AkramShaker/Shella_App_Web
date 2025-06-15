import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/controllers/orders_controller.dart';
import 'package:shella_design/features/orders/widgets/builds/build_order_card.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_navigators.dart';

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

    // Fetch the first page if not already loaded
    if (orderProvider.runningOrders == null ||
        orderProvider.runningOrders!.orders!.isEmpty) {
      orderProvider.getrunningOrders();
    }

    _scrollController.addListener(() {
      final provider = OrdersController.get(context, listen: false);

      final currentLength = provider.runningOrders?.orders?.length ?? 0;
      final total = provider.runningOrders?.totalSize ?? 0;
      final isLoading = provider.runningOrdersstate == OrderState.loading;

      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
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
        final isLoading = provider.runningOrdersstate == OrderState.loading;
        final isInitial = provider.runningOrdersstate == OrderState.initial;

        if (orders.isEmpty && (isLoading || isInitial)) {
          return const Center(child: CircularProgressIndicator());
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

        return ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.only(bottom: 10),
          itemCount: orders.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == orders.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final order = orders[index];
            return InkWell(
              onTap: () {
                pushNewScreen(context, AppRoutes.step_one_service_screen);
              },
              child: buildOrderCard(order, context),
            );
          },
        );
      },
    );
  }
}
