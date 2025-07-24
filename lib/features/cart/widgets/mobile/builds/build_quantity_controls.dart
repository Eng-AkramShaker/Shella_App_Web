import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/domain/models/cart_model.dart';

Widget buildQuantityControls(CartItem cartItem, CartController controller) {
  final tempQuantity = controller.getTempQuantity(cartItem.id!);

  final isMax =
      cartItem.item?.stock != null && tempQuantity >= cartItem.item!.stock!;
  final isMin = cartItem.quantity != null && cartItem.quantity! <= 1;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            InkWell(
              onTap: isMin
                  ? null
                  : () => controller.decreaseTempQuantity(cartItem.id!),
              child: Container(
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                    border:
                    Border.all(color: AppColors.secondaryColor, width: 1),
                    shape: BoxShape.circle),
                constraints: BoxConstraints(),
                child: Icon(Icons.remove),
              ),
            ),
            SizedBox(width: 15.sp),
            // Quantity display
            Text('${controller.getTempQuantity(cartItem.id!)}',
                style: TextStyle(fontSize: 18.sp)),

            SizedBox(width: 15.sp),
            InkWell(
              onTap: isMax
                  ? null
                  : () => controller.increaseTempQuantity(cartItem.id!),
              child: Container(
                padding: EdgeInsets.all(6.sp),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                constraints: BoxConstraints(),
                child: Icon(
                  Icons.add,
                  size: 24.sp,
                  color: AppColors.wtColor,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}