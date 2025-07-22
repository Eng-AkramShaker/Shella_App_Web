import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/custom_button.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/features/my_points/controllers/my_points_controller.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';

class LoyaltyBottomSheetWidget extends StatefulWidget {
  final String amount;
  const LoyaltyBottomSheetWidget({super.key, required this.amount});

  @override
  _LoyaltyBottomSheetWidgetState createState() =>
      _LoyaltyBottomSheetWidgetState();
}

class _LoyaltyBottomSheetWidgetState extends State<LoyaltyBottomSheetWidget> {
  late final TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.amount);
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loyalty = context.watch<LoyaltyProvider>();
    final splash = context.read<SplashController>();
    final rate = splash.configModel?.loyaltyPointExchangeRate ?? 0;
    final minPoints = splash.configModel?.loyaltyPointMinimumPoint ?? 0;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Stack(
        children: [
          Container(
            width: ResponsiveLayout.isWeb() ? 400 : double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('every $rate points = €1'),
                  Text('(From ${widget.amount} points)'),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Enter amount',
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    // textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    buttonText: 'Convert',
                    isLoading: loyalty.isLoading,
                    color: AppColors.primaryColor,
                    onPressed: () {
                      final text = _amountController.text.trim();
                      if (text.isEmpty) {
                        nav.back;
                        showCustomSnackBar('input_field_is_empty',
                            isError: true);
                        return;
                      }
                      final value = int.tryParse(text) ?? 0;
                      final available =
                          context.read<LoyaltyProvider>().user?.loyaltyPoint ??
                              0;
                      if (value < minPoints) {
                        nav.back;
                        showCustomSnackBar(
                            'please_exchange_more_than $minPoints points',
                            isError: true);
                      } else if (value > available) {
                        nav.back;
                        showCustomSnackBar(
                            'you_do_not_have_enough_point_to_exchange',
                            isError: true);
                      } else {
                        loyalty.convertPoints(value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => nav.back,
            ),
          ),
        ],
      ),
    );
  }
}
