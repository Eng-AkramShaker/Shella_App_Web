import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/loading/loading.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/notifications/controllers/notifications_controller.dart';
import 'package:shella_design/features/notifications/widgets/notification_card.dart';

class NotificationsComponnent extends StatefulWidget {
  const NotificationsComponnent({super.key});

  @override
  State<NotificationsComponnent> createState() => _NotificationsComponnentState();
}

class _NotificationsComponnentState extends State<NotificationsComponnent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(() {
    //   final provider = NotificationsController.get(context, listen: false);

    //   final currentLength = provider.historyOrders?.orders?.length ?? 0;
    //   final total = provider.historyOrders?.totalSize ?? 0;
    //   final isLoadMoreInProgress =
    //       provider.loadMoreHistoryState == OrderState.loading;

    //   if (_scrollController.position.pixels >=
    //           _scrollController.position.maxScrollExtent - 200 &&
    //       !isLoadMoreInProgress &&
    //       currentLength < total) {
    //     provider.loadMoreHistoryOrders();
    //   }
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsController>(
      builder: (context, notificationsController, _) {
        final notifications = notificationsController.myNotifications ?? [];

        if (notificationsController.notificatiosState == NotificatiosState.loading) {
          return const Center(
              child: Loading(
            color: AppColors.primaryColor,
          ));
        }

        if (notifications.isEmpty) {
          return Center(
            child: Custom_Text(
              context,
              text: "لا توجد اشعارات",
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
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationCard();
                },
              ),
            ),
            // (ordersController.loadMoreHistoryState == OrderState.loading)
            //     ? Loading(
            //         color: AppColors.primaryColor,
            //       )
            //     : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
