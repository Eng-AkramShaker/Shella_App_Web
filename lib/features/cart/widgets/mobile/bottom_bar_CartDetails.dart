// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/loading/custom_loading.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/domain/models/cart_model.dart';
import 'package:shella_design/features/product/widgets/buttons/quantity_selector.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'builds/build_quantity_controls.dart';

class BottomBar_CartDetails extends StatelessWidget {
  const BottomBar_CartDetails(
      {super.key, required this.item, required this.cartController});

  final CartItem item;
  final CartController cartController;
  const BottomBar_CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildQuantityControls(item, cartController),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            width: 450.w,
            child: ElevatedButton(
              onPressed: () async {
                cartController.setAddToCartLoading(true);
                final currentQty = cartController.getTempQuantity(item.id!);
                final note = cartController.getTempNote(item.id!);

                await cartController.updateQuantity(
                  item.id!,
                  currentQty,
                  item.price ?? 0,
                );
                await cartController.addItem(
                  itemId: item.id!,
                  quantity: currentQty,
                  price: item.price ?? 0,
                  addOns: note.trim().isNotEmpty ? [note.trim()] : null,
                );

                await cartController.loadCartItems();
                cartController.setAddToCartLoading(false);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: cartController.isAddToCartLoading
                  ? CustomLoading(color: AppColors.wtColor)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.shopping_cart,
                                color: Colors.white, size: 20),
                            SizedBox(width: 6),
                            Custom_Text(context,
                                text: "أضف إلى السلة",
                                style: font14White400W(context)),
                          ],
                        ),
                        Custom_Text(context,
                            text: "|", style: font14White400W(context)),
                        Row(
                          children: [
                            Custom_Text(context,
                                text: "${item.price! * item.quantity!} ريال",
                                style: font14White400W(context)),
                            SizedBox(width: 5),
                            Icon(Icons.money,
                                color: AppColors.wtColor, size: 20),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
