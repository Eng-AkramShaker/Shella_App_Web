import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/Balance/controller/balance_controller.dart';
import 'package:shella_design/features/Balance/widget/amount_input_field.dart';
import 'package:shella_design/features/Balance/widget/builds/build_amount_btns_row.dart';
import 'package:shella_design/features/Balance/widget/builds/build_max_account_text.dart';
import 'package:shella_design/features/Balance/widget/header_section.dart';
import 'package:shella_design/features/Balance/widget/submit_button.dart';
import 'package:shella_design/common/util/app_colors.dart';

class AddCredit extends StatelessWidget {
  const AddCredit({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BalanceController(),
      child: AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        alignment: Alignment.bottomCenter,
        content: _buildDialogContent(context),
      ),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Consumer<BalanceController>(
      builder: (context, controller, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 350,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(
                headtext: 'إضافة رصيد',
                bodytext: 'مبلغ الشحن',
              ),
              const SizedBox(height: 16),
              buildAmountButtonsRow(controller, true),
              const SizedBox(height: 16),
              AmountInputField(
                controller: controller,
                hintText: 'مبلغ الشحن',
                textcontroller: controller.additionamount,
              ),
              const SizedBox(height: 16),
              buildMaxAmountText(context),
              const Spacer(),
              SubmitButton(onPressed: () {}),
            ],
          ),
        );
      },
    );
  }
}
