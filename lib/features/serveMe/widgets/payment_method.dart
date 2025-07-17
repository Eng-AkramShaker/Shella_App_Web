import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final serveMeController = context.watch<ServeMeController>();
    return SizedBox(
        height: 170,
        child: Card(
            color: AppColors.backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(context, text: "طريقة الدفع", style: font11Black500W(context, size: size_16(context))),
                    SizedBox(height: 15),
                    _buildRadioOption(
                      context: context,
                      icon: Icons.money,
                      mainlabel: "نقدآ",
                      groupValue: serveMeController.paymentMethod,
                      onChanged: (value) {
                        serveMeController.updatepaymentMethod(value!);
                      },
                      value: 'cash',
                    ),
                    SizedBox(height: 10),
                    _buildRadioOption(
                      context: context,
                      icon: Icons.account_balance_wallet_outlined,
                      mainlabel: "عن طريق المحفظة",
                      groupValue: serveMeController.paymentMethod,
                      onChanged: (value) {
                        serveMeController.updatepaymentMethod(value!);
                      },
                      value: 'wallet',
                    )
                  ],
                ))));
  }

  Widget _buildRadioOption({
    required BuildContext context,
    required IconData icon,
    required String mainlabel,
    required String value,
    required String? groupValue,
    required Function(String?) onChanged,
  }) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: AppColors.gryColor_8, border: Border.all(color: AppColors.gryColor_3), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 20,
              color: AppColors.greenColor,
            ),
            Spacer(flex: 1),
            Custom_Text(
              context,
              text: mainlabel,
              style: font10Grey400W(context, size: size_12(context)),
            ),
            Spacer(flex: 15),
            RadioTheme(
              data: RadioThemeData(
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.secondaryColor;
                  }
                  return AppColors.gryColor_3;
                }),
              ),
              child: Radio<String>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
