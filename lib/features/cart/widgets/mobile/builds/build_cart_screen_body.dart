import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/widgets/mobile/builds/build_summary_section.dart';

import 'build_cart_item.dart';
import 'build_promo_code_input.dart';

Widget buildCartScreenBody(
    BuildContext context, CartController cartController) {
  if (cartController.state == CartState.initial
      //|| cartController.state == CartState.loading
      ) {
    return const Center(child: CircularProgressIndicator());
  }

  if (cartController.state == CartState.error) {
    return Center(child: Text(cartController.errorMessage ?? 'حدث خطأ'));
  }

  return Padding(
    padding: const EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int index = 0; index < cartController.cartItems.length; index++)
            buildCartItem(cartController.cartItems[index], index, context),
          buildPromoCodeInput(context),
          SizedBox(height: 16.h),
          buildSummarySection(context, cartController),
        ],
      ),
    ),
  );
}
