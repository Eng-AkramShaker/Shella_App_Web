import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/helper/date_converter.dart';
import 'package:shella_design/common/helper/price_converter.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/my_points/domain/models/transaction_model.dart';

class HistoryItemWidget extends StatelessWidget {
  final int index;
  final bool fromWallet;
  final List<Transaction>? data;
  const HistoryItemWidget({super.key, required this.index, required this.fromWallet, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Flexible(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            fromWallet
                ? Row(children: [
                    data![index].transactionType == 'order_place' || data![index].transactionType == 'partial_payment'
                        ? Icon(
                            Icons.wallet,
                            size: 15,
                          )
                        : Icon(
                            Icons.wallet_giftcard,
                            size: 15,
                          ),
                    const SizedBox(width: 5),
                    Text(
                      data![index].transactionType == 'order_place' || data![index].transactionType == 'partial_payment'
                          ? '- ${PriceConverter.convertPrice(data![index].debit! + data![index].adminBonus!)}'
                          : '+ ${PriceConverter.convertPrice(data![index].credit! + data![index].adminBonus!)}',
                      style: font14Black500W(context).copyWith(fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                    ),
                  ])
                : Row(children: [
                    data![index].transactionType == 'point_to_wallet'
                        ? Icon(
                            Icons.money_off,
                            size: 13,
                          )
                        : Icon(Icons.money),
                    const SizedBox(width: 5),
                    Text(
                        data![index].transactionType == 'point_to_wallet'
                            ? '-${data![index].debit!.toStringAsFixed(0)}'
                            : '+${data![index].credit!.toStringAsFixed(0)}',
                        style: font14Black500W(context).copyWith(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(width: 5),
                    Text(
                      'points',
                      style: font14Black500W(context).copyWith(fontSize: 14, color: Theme.of(context).disabledColor),
                    )
                  ]),
            const SizedBox(height: 5),
            Text(
              data![index].transactionType == 'add_fund'
                  ? '${'added_via'} ${data![index].referance!.replaceAll('_', ' ')} ${data![index].adminBonus != 0 ? '(${'bonus'} = ${data![index].adminBonus})' : ''}'
                  : data![index].transactionType == 'partial_payment'
                      ? '${'spend_on_order'} # ${data![index].referance}'
                      : data![index].transactionType == 'loyalty_point'
                          ? 'converted_from_loyalty_point'
                          : data![index].transactionType == 'referrer'
                              ? 'earned_by_referral'
                              : data![index].transactionType == 'order_place'
                                  ? '${'order_place'} # ${data![index].referance}'
                                  : data![index].transactionType!,
              style: font14Black500W(context).copyWith(fontSize: 12, color: Theme.of(context).hintColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ]),
        ),
        const SizedBox(width: 15),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(
            DateConverter.dateToDateAndTimeAm(data![index].createdAt!),
            style: font14Black500W(context).copyWith(fontSize: 14, color: Theme.of(context).hintColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            fromWallet
                ? data![index].transactionType == 'order_place' || data![index].transactionType == 'partial_payment'
                    ? 'debit'
                    : 'credit'
                : data![index].transactionType == 'point_to_wallet'
                    ? 'debit'
                    : 'credit',
            style: font14Black500W(context).copyWith(
                fontSize: 14,
                color: fromWallet
                    ? data![index].transactionType == 'order_place' || data![index].transactionType == 'partial_payment'
                        ? Colors.red
                        : Colors.green
                    : data![index].transactionType == 'point_to_wallet'
                        ? Colors.red
                        : Colors.green),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ]),
      ]),
      index == data!.length - 1
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(color: Theme.of(context).disabledColor),
            ),
    ]);
  }
}
