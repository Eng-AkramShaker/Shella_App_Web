import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/domain/models/cart_model.dart';

Widget buildDetailsControl(BuildContext context, CartItem cartItem,
    CartController controller, bool isLoading) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      custom_Images_asset(
          image: cartItem.item?.image ?? "",
          h: 80.h,
          w: 90.w,
          fit: BoxFit.fill),
      Container(
        color: AppColors.wtColor,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: isLoading
                  ? null
                  : () {
                      controller.increaseQuantity(cartItem.id!);
                    },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  border: Border.all(color: AppColors.secondaryColor, width: 2),
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(),
                child: Icon(
                  Icons.add,
                  color: AppColors.wtColor,
                ),
              ),
            ),
            isLoading
                ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  )
                : Custom_Text(context,
                    text: '${cartItem.quantity}',
                    style: font14Black500W(context)),
            InkWell(
              onTap: isLoading
                  ? null
                  : () => controller.decreaseQuantity(cartItem.id!),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondaryColor, width: 2),
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(),
                child: Icon(Icons.remove),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 3.h),
    ],
  );
}
