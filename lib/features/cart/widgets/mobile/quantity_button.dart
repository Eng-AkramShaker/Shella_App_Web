import 'package:flutter/material.dart';

import '../../../../common/util/app_colors.dart';
import '../../controllers/cart_controller.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton(
      {super.key,
      required this.controller,
      required this.onTap,
      required this.icon});

  final CartController controller;
  final VoidCallback onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // (){
      //    controller.increaseQuantity(controller.selectedItem!.id!);
      // },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryColor, width: 2),
          shape: BoxShape.circle,
        ),
        constraints: BoxConstraints(),
        child: icon,
      ),
    );
  }
}
