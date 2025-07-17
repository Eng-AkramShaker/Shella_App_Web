import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';

Future<void> selectExpirationDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2050),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.greenColor,
          ),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    final formattedDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    context.read<KaidhaFormController>().updateExpirationDate(formattedDate);
  }
}
