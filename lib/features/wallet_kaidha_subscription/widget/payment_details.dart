import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/helper/price_converter.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/wallet_kaidha_model.dart';

class PaymentDetails extends StatelessWidget {
  final Wallet wallet;
  const PaymentDetails({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // details of balance
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Custom_Text(context, text: "تاريخ انتهاء الشهر :", style: font14Black500W(context)),
                          SizedBox(width: 5),
                          Custom_Text(context, text: wallet.lockDay, style: font16SecondaryColor400W(context)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Custom_Text(context, text: wallet.serialNumber, style: font13Green500W(context, size: 20)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Custom_Text(context, text: 'قيدها', style: font13Black400W(context)),
                          Custom_Text(context, text: ' | ', style: TextStyle(color: Colors.grey)),
                          Custom_Text(context,
                              text: wallet.status == "Pending"
                                  ? "pending".tr()
                                  : wallet.status == "Active"
                                      ? "available".tr()
                                      : "closed_now".tr(),
                              style: font16SecondaryColor400W(context)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            // available balance
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(context, text: 'الرصيد المتاح', style: font13Black400W(context)),
                SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PriceConverter.convertPrice2(
                      context,
                      profController.user!.walletBalance,
                      textStyle: font14Black600W(context),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  value: wallet.usedPercentage / 100,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Custom_Text(context, text: 'حدد البطاقة', style: font13Grey400W(context)),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PriceConverter.convertPrice2(
                          context,
                          double.parse(wallet.availableBalance.toString()),
                          textStyle: font13Grey400W(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ========================================================================================================

class PaymentDetailsShimmer extends StatelessWidget {
  const PaymentDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // details of balance
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Custom_Text(context, text: "تاريخ انتهاء الشهر :", style: font14Black500W(context)),
                          SizedBox(width: 5),
                          Custom_Text(context, text: 'yyyy/MM/dd', style: font16SecondaryColor400W(context)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Custom_Text(context, text: "XXX  XXXX XXXXX", style: font13Green500W(context, size: 20)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Custom_Text(context, text: 'قيدها', style: font13Black400W(context)),
                          Custom_Text(context, text: ' | ', style: TextStyle(color: Colors.grey)),
                          Custom_Text(context, text: "لا توجد محفظة", style: font16SecondaryColor400W(context)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            // available balance
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(context, text: 'الرصيد المتاح', style: font13Black400W(context)),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PriceConverter.convertPrice2(
                      context,
                      0.00,
                      textStyle: font11Black400W(context),
                      prefixText: 'ر.س ',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  value: 0 / 100,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Custom_Text(context, text: 'حدد البطاقة', style: font13Grey400W(context)),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PriceConverter.convertPrice2(
                          context,
                          0.00,
                          textStyle: font13Grey400W(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
