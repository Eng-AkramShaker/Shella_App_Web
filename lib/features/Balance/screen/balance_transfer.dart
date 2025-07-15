import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/Balance/controller/balance_controller.dart';
import 'package:shella_design/features/Balance/widget/amount_input_field.dart';
import 'package:shella_design/features/Balance/widget/builds/build_amount_btns_row.dart';
import 'package:shella_design/features/Balance/widget/builds/build_max_account_text.dart';
import 'package:shella_design/features/Balance/widget/header_section.dart';
import 'package:shella_design/features/Balance/widget/submit_button.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';

class BalanceTransfer extends StatelessWidget {
  const BalanceTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BalanceController(),
      child: AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        alignment: Alignment.bottomCenter,
        content: buildDialogContent(context),
      ),
    );
  }

  Widget buildDialogContent(BuildContext context) {
    return Consumer<BalanceController>(builder: (context, controller, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 450,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(
              headtext: MainAppConstants.balanceTransfer,
              bodytext: MainAppConstants.transferAmount,
            ),
            const SizedBox(height: 16),
            buildAmountButtonsRow(controller, false),
            const SizedBox(height: 16),
            AmountInputField(
              controller: controller,
              hintText: MainAppConstants.transferAmount,
              textcontroller: controller.transferamount,
            ),
            const SizedBox(height: 16),
            buildMaxAmountText(context),
            const Spacer(),
            Custom_Text(context,
                text: MainAppConstants.enterPhoneAccountHolder,
                style: font10Black400W(context, size: size_12(context))),
            const SizedBox(height: 10),
            CustomPhoneInput(
              controller: controller.phone,
              onChanged: (p0) {},
            ),
            const Spacer(),
            SubmitButton(onPressed: () {}),
          ],
        ),
      );
    });
  }
}
