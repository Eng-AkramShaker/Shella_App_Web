import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/Balance/controller/balance_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class AmountButton extends StatelessWidget {
  final String value;
  final bool isaddition;
  const AmountButton({
    super.key,
    required this.value,
    required this.isaddition,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BalanceController>(
      builder: (context, controller, child) {
        final isOther = value == 'أخرى';
        final isSelected = _calculateIsSelected(isOther, controller);

        return SizedBox(
          width: 70,
          child: ChoiceChip(
            label: Center(
              child: Custom_Text(
                context,
                text: isOther ? value : '$value ر.س',
                style: isSelected ? font10White400W(context, size: size_14(context)) : font10Grey400W(context, size: size_14(context)),
              ),
            ),
            selected: isSelected,
            showCheckmark: false,
            onSelected: (_) => isaddition ? controller.selectaddonAmount(value) : controller.selecttransferAmount(value),
            backgroundColor: AppColors.backgroundColor,
            selectedColor: AppColors.primaryColor,
            side: BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        );
      },
    );
  }

  bool _calculateIsSelected(bool isOther, BalanceController controller) {
    if (isOther) {
      return controller.selectedAmount.isNotEmpty && !['30', '60', '100'].contains(controller.selectedAmount);
    }
    return controller.selectedAmount == value;
  }
}
