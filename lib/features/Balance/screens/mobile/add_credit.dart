import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/Balance/controllers/balance_controller.dart';
import 'package:shella_design/features/Balance/domain/repositories/balance_repo.dart';
import 'package:shella_design/features/Balance/domain/services/balance_service.dart';
import 'package:shella_design/features/Balance/widgets/mobile/amount_input_field.dart';
import 'package:shella_design/features/Balance/widgets/mobile/builds/build_amount_btns_row.dart';
import 'package:shella_design/features/Balance/widgets/mobile/builds/build_max_account_text.dart';
import 'package:shella_design/features/Balance/widgets/mobile/header_section.dart';
import 'package:shella_design/features/Balance/widgets/mobile/submit_button.dart';
import 'package:shella_design/features/Balance/widgets/mobile/success_sheet.dart';
import 'package:shella_design/features/Balance/widgets/mobile/failed_sheet.dart';

class AddCredit extends StatelessWidget {
  const AddCredit({super.key});

  // Constants
  static const double _dialogHeight = 350;
  static const double _padding = 20;
  static const double _spacing = 16;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return _buildWithDependencies(context, snapshot.data!);
        }

        // Show loading indicator while waiting for SharedPreferences
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildWithDependencies(
      BuildContext context, SharedPreferences sharedPreferences) {
    // Initialize the service and repository
    final apiClient = ApiClient(
      appBaseUrl: 'https://shalafood.net',
      sharedPreferences: sharedPreferences,
    );
    final balanceRepo = BalanceRepo(
      apiClient: apiClient,
      sharedPreferences: sharedPreferences,
    );
    final balanceService = BalanceService(
      balanceRepositoryInterface: balanceRepo,
    );

    return ChangeNotifierProvider(
      create: (_) => BalanceController(
        balanceServiceInterface: balanceService,
      ),
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
          height: _dialogHeight,
          padding: const EdgeInsets.all(_padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(
                headtext: 'إضافة رصيد',
                bodytext: 'مبلغ الشحن',
              ),
              const SizedBox(height: _spacing),
              buildAmountButtonsRow(controller, true),
              const SizedBox(height: _spacing),
              AmountInputField(
                controller: controller,
                hintText: 'مبلغ الشحن',
                textcontroller: controller.additionamount,
              ),
              const SizedBox(height: _spacing),
              buildMaxAmountText(context),
              const Spacer(),
              _buildSubmitButton(context, controller),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubmitButton(
      BuildContext context, BalanceController controller) {
    if (controller.state == BalanceState.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SubmitButton(
      onPressed: () {
        if (controller.additionamount.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('الرجاء إدخال مبلغ الشحن')),
          );
          return;
        }

        // Add the credit amount to the user's balance
        _addCredit(context, controller.additionamount.text);
      },
    );
  }

  void _addCredit(BuildContext context, String amount) async {
    final controller = Provider.of<BalanceController>(context, listen: false);

    // Call the API to add credit
    final response = await controller.addFund();

    // Close the current bottom sheet first in both cases
    Navigator.of(context).pop();

    // Show appropriate sheet based on response
    _showResponseSheet(context, response.isSuccess, amount, response.message);
  }

  void _showResponseSheet(
      BuildContext context, bool isSuccess, String amount, String? message) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return isSuccess
            ? SuccessSheet(
                amount: amount,
                onDone: () => Navigator.of(context).pop(),
              )
            : FailedSheet(
                message:
                    message ?? 'عذراً أن رصيد المحفظة غير كافي لاجراء العملية',
                onDone: () => Navigator.of(context).pop(),
              );
      },
    );
  }
}
