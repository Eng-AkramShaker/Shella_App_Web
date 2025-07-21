import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/domain/models/cart_model.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_navigators.dart';

import 'build_item_details.dart';

Widget buildCartItem(CartItem item, int index, BuildContext context) {
  return InkWell(
    onTap: () {
      final cartController = context.read<CartController>();
      cartController.selectItem(item);
      pushNewScreen(context, AppRoutes.cartDetails);
    },
    child: Card(
      color: AppColors.wtColor,
      elevation: 3,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 10.h),
        width: width_media(context),
        child: Consumer<CartController>(
            builder: (context, CartController cartController, _) {
          return Column(
            children: [
              BuildItemDetails(
                  cartItem: item, index: index, cartController: cartController),
              // buildQuantityControls(item, cartController),
            ],
          );
        }),
      ),
    ),
  );
}
