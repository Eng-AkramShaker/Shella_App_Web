// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shella_design/common/helper/price_converter.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/wallet_kaidha_model.dart';

class PaymentOptions extends StatefulWidget {
  final Wallet wallet;
  const PaymentOptions({super.key, required this.wallet});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'title': 'المبلغ المستحق بالكامل',
        'amount': double.parse(widget.wallet.usedBalance!),
      },
      {
        'title': 'المبلغ الأدنى المستحق',
        'amount': double.parse(widget.wallet.minimumDueLimit!.toString()),
      },
    ];
    return GetBuilder<KaidhaSubscription_Controller>(builder: (KaidhaSubController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(context, text: 'خيارات الدفع', style: font14Black500W(context)),
              Column(
                children: List.generate(
                  list.length,
                  (int index) => Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;

                          KaidhaSubController.onChange_another_amount(list[selectedIndex]["amount"].toString());
                        });
                      },
                      child: Container(
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Custom_Text(context, text: list[index]['title'], style: font13Black400W(context)),
                                      SizedBox(height: 5),
                                      PriceConverter.convertPrice2(list[index]['amount'])
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Radio<int>(
                                  activeColor: Colors.green,
                                  value: index,
                                  groupValue: selectedIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedIndex = value!;
                                    });
                                    KaidhaSubController.onChange_another_amount(list[selectedIndex]["amount"].toString());
                                  },
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
