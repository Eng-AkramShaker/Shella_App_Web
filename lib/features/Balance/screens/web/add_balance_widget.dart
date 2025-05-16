import 'package:shella_design/features/Balance/widgets/web/amount_button.dart';
import 'package:shella_design/features/Balance/widgets/web/amount_input_field.dart';
import 'package:shella_design/features/Balance/controllers/balance_controller.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/Balance/widgets/web/balance_success_toast.dart';
import 'package:shella_design/features/Balance/widgets/web/balance_error_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/features/Balance/domain/repositories/balance_repo.dart';
import 'package:shella_design/features/Balance/domain/services/balance_service.dart';

class AddBalanceWidget extends StatelessWidget {
  const AddBalanceWidget({super.key});

  // Constants to avoid magic numbers
  static const double _dialogHeight = 600;
  static const double _dialogWidth = 1000;
  static const double _horizontalPadding = 100;
  static const double _buttonHeight = 60;
  static const List<String> _amountOptions = ['30', '60', '100', 'أخرى'];

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
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        );
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
      child: Consumer<BalanceController>(
        builder: (context, controller, child) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            backgroundColor: const Color.fromARGB(255, 230, 233, 240),
            content: _buildDialogContent(context, controller),
          );
        },
      ),
    );
  }

  Widget _buildDialogContent(
      BuildContext context, BalanceController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: IconButtonCircle(
              color: const Color.fromARGB(255, 230, 233, 240),
              onPressed: () => Navigator.of(context).pop(),
              icon: Icons.close,
            ),
          ),
          SizedBox(
            height: _dialogHeight,
            width: _dialogWidth,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(
                      context,
                      text: "إضافة رصيد",
                      style: font18Black700W(context, size: 28),
                    ),
                    const SizedBox(height: 10),
                    Custom_Text(
                      context,
                      text: "مبلغ الشحن",
                      style: font10Grey400W(context, size: 21),
                    ),
                    const SizedBox(height: 10),
                    _buildAmountButtonsRow(context, controller),
                    const SizedBox(height: 16),
                    AmountInputField(
                      controller: controller,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      hintStyle: font10Grey400W(context, size: 16),
                      suffixStyle: font10Grey400W(context, size: 16),
                      borderSideColor: AppColors.gryColor_3,
                      hintText: "مبلغ التحويل",
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Custom_Text(
                        context,
                        text: 'الحد الأقصى 1000.00 ر.س',
                        style: font10Grey500W(context, size: 12),
                      ),
                    ),
                    const SizedBox(height: 25),
                    _buildSubmitButton(context, controller),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(
      BuildContext context, BalanceController controller) {
    return Center(
      child: controller.isLoading
          ? Container(
              height: _buttonHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ),
            )
          : custom_Button(
              h: _buttonHeight,
              context,
              title: "إضافة الرصيد",
              style: font10White400W(context),
              buttoncolor: AppColors.primaryColor,
              onPressed: () {
                if (controller.additionamount.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('الرجاء إدخال مبلغ الشحن')),
                  );
                  return;
                }

                if (!controller.isLoading) {
                  _addCredit(context, controller);
                }
              },
            ),
    );
  }

  void _addCredit(BuildContext context, BalanceController controller) async {
    // Set loading state to true
    controller.setLoading(true);

    // Call the API to add credit
    final response = await controller.addFund();

    // Set loading state to false after API call completes
    controller.setLoading(false);

    // Close the dialog first in both cases
    Navigator.of(context).pop();

    // Show appropriate toast based on response
    _showResponseToast(
        context, response.isSuccess, controller.additionamount.text);
  }

  void _showResponseToast(BuildContext context, bool isSuccess, String amount) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: isSuccess
              ? BalanceSuccessToast(
                  amount: amount,
                  onClose: () => Navigator.of(context).pop(),
                )
              : BalanceErrorToast(
                  message: "الرجاء المحاولة لاحقاً",
                  onClose: () => Navigator.of(context).pop(),
                ),
        ),
      ),
    );
  }

  Widget _buildAmountButtonsRow(
      BuildContext context, BalanceController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _amountOptions
          .map((value) => AmountButton(
                borderRadius: BorderRadius.circular(10),
                notSelectedBorderSideColor: AppColors.secondaryColor,
                selectedBorderSideColor: AppColors.primaryColor,
                selectedColor: const Color.fromARGB(255, 230, 233, 240),
                backgroundColor: const Color.fromARGB(255, 230, 233, 240),
                isNotSelectedTextStyle:
                    font16SecondaryColor700W(context, size: 16),
                isSelectedTextStyle: font18Green500W(context, size: 16),
                height: 30,
                width: 150,
                value: value,
                controller: controller,
              ))
          .toList(),
    );
  }
}
