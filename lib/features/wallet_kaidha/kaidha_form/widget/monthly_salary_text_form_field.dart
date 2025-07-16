import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class MonthlySalary extends StatelessWidget {
  const MonthlySalary({
    super.key,
    required this.kaidhaFormController,
  });

  final KaidhaFormController kaidhaFormController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.bgColor,
      controller: kaidhaFormController.monthlyIncome,
      decoration: InputDecoration(
          hintText: "ادخل الدخل الشهري تقريبآ",
          hintStyle: font10Grey500W(context, size: size_14(context)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.gryColor_3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.greenColor),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
