import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/Balance/controller/balance_controller.dart';
import 'package:shella_design/features/Balance/widget/mobile/amount_button.dart';

Widget buildAmountButtonsRow(BalanceController controller, bool isaddition) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      '30',
      '60',
      '100',
      'أخرى',
    ]
        .map((value) => AmountButton(
              value: value,
              isaddition: isaddition,
            ))
        .toList(),
  );
}
