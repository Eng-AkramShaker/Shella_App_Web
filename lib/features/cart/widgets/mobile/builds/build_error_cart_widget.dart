import 'package:flutter/material.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';

import '../../../../settings/widgets/mobile/profile_buttons.dart';


Widget buildErrorCartWidget(CartController controller) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(controller.errorMessage!),
        const SizedBox(height: 10),
        ProfileButton(
          title: 'إعادة المحاولة',
          onTap: () => controller.loadCartItems(),
        ),
      ],
    ),
  );
}