import 'package:shella_design/features/Balance/controllers/balance_controller.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:provider/provider.dart';

class AmountButton extends StatelessWidget {
  final String value;
  final BalanceController controller;
  final double? height;
  final double? width;
  final TextStyle? isSelectedTextStyle;
  final TextStyle? isNotSelectedTextStyle;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? selectedBorderSideColor;
  final Color? notSelectedBorderSideColor;
  final BorderRadiusGeometry? borderRadius;
  const AmountButton({
    super.key,
    required this.value,
    required this.controller,
    this.height,
    this.width,
    this.isSelectedTextStyle,
    this.isNotSelectedTextStyle,
    this.backgroundColor,
    this.selectedColor,
    this.selectedBorderSideColor,
    this.notSelectedBorderSideColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BalanceController>(builder: (context, controller, child) {
      final isOther = value == 'أخرى';
      final isSelected = _calculateIsSelected(controller, isOther);

      return ChoiceChip(
        label: SizedBox(
          height: height ?? 26,
          width: width ?? 65,
          child: Center(
            child: Custom_Text(context,
                text: isOther ? value : '$value ر.س',
                style: isSelected
                    ? isSelectedTextStyle ??
                        font10White400W(context, size: size_14(context))
                    : isNotSelectedTextStyle ??
                        font10Grey400W(context, size: size_14(context))),
          ),
        ),
        selected: isSelected,
        showCheckmark: false,
        onSelected: (_) => controller.selectaddonAmount(value),
        backgroundColor: backgroundColor ?? AppColors.backgroundColor,
        selectedColor: selectedColor ?? AppColors.primaryColor,
        side: BorderSide(
          color: isSelected
              ? selectedBorderSideColor ?? AppColors.primaryColor
              : notSelectedBorderSideColor ?? AppColors.primaryColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      );
    });
  }

  bool _calculateIsSelected(BalanceController controller, bool isOther) {
    if (isOther) {
      return controller.selectedAmount.isNotEmpty &&
          !['30', '60', '100'].contains(controller.selectedAmount);
    }
    return controller.selectedAmount == value;
  }
}
