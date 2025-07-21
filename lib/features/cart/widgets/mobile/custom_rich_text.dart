import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/domain/models/cart_model.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required CartItem item,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    // final item = cartController.selectedItem;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.bgColor,
        ),
        children: [
          // TextSpan(text: '${item?.item?.name ?? ""}\n'),
          // TextSpan(text: '30 ظرف '),
          // TextSpan(
          //     text: ' + 5 هدية',
          //     style: TextStyle(color: AppColors.secondaryColor)),
        ],
      ),
    );
  }
}
