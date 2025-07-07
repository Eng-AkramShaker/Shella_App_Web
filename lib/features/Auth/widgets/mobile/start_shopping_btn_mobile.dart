import 'package:flutter/material.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';

class StartShoppingButton extends StatelessWidget {
  const StartShoppingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.greenColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: () {
          pushAndRemoveUntil(context, AppRoutes.mainLayout);
        },
        child: Text(
          "بدء التسوق",
          style: font14White600W(context),
        ),
      ),
    );
  }
}
