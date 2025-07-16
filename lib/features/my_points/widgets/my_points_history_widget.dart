import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/history_item_widget.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/features/my_points/controllers/my_points_controller.dart';

class LoyaltyHistoryWidget extends StatelessWidget {
  const LoyaltyHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loyalty = context.watch<LoyaltyProvider>();
    final list = loyalty.transactionList;

    if (list == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (list.isEmpty) {
      return Center(
        child: Image.asset(
          AppImages.noDataFound,
          height: 50,
          width: 50,
        ),
      );
    }

    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, idx) => HistoryItemWidget(
            index: idx,
            fromWallet: false,
            data: list,
          ),
        ),
        if (loyalty.isLoading)
          const Padding(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
