import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/domain/models/cart_model.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

import 'package:shella_design/features/cart/widgets/mobile/counter_iconButton.dart';

class BuildItemDetails extends StatefulWidget {
  const BuildItemDetails(
      {super.key,
      required this.cartItem,
      required this.index,
      required this.cartController});

  final CartItem cartItem;
  final int index;
  final CartController cartController;

  @override
  State<BuildItemDetails> createState() => _BuildItemDetailsState();
}

class _BuildItemDetailsState extends State<BuildItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, controller, _) {
      final isLoading = controller.itemLoading[widget.cartItem.id] ?? false;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: CounterButton(
                        icon: Icons.cancel,
                        size: 24,
                        color: AppColors.bgColor,
                        onPressed: () {
                          widget.cartController.removeItem(widget.cartItem.id!);
                        })),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(context,
                          text: widget.cartItem.item?.name ?? "",
                          style: font11Black600W(context)),
                      Custom_Text(context,
                          text: widget.cartItem.item?.description ?? "",
                          style: font12Grey400W(context, lineHeight: 2)),
                      Custom_Text(context,
                          text: "${widget.cartItem.price}" ?? "",
                          style: font13SecondaryColor600W(context)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 94.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custom_Images_asset(
                    image: widget.cartItem.item?.image ?? "",
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
                        // onTap:
                        // _isUpdating
                        //     ? null
                        //     : () => _safeUpdate(() => controller
                        //         .increaseQuantity(widget.cartItem.id!)),
                        //    () {
                        // controller
                        //     .increaseQuantity(widget.cartItem.itemId!);
                        //  },
                        onTap: isLoading
                            ? null
                            : () {
                                controller
                                    .increaseQuantity(widget.cartItem.id!);
                              },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            border: Border.all(
                                color: AppColors.secondaryColor, width: 2),
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
                              child: const CircularProgressIndicator(
                                  strokeWidth: 2),
                            )
                          : Custom_Text(context,
                              text: '${widget.cartItem.quantity}',
                              style: font14Black500W(context)),
                      InkWell(
                        //    onTap:
                        // _isUpdating
                        //     ? null
                        //     : () => _safeUpdate(() => controller
                        //         .decreaseQuantity(widget.cartItem.id!)),
                        //  () {
                        // controller
                        //     .decreaseQuantity(widget.cartItem.itemId!);
                        // },
                        onTap: isLoading
                            ? null
                            : () => controller
                                .decreaseQuantity(widget.cartItem.id!),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.secondaryColor, width: 2),
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
            ),
          ),
        ],
      );
    });
  }
//
// Future<void> _safeUpdate(Future<void> Function() action) async {
//   setState(() => _isUpdating = true);
//   try {
//     await action();
//   } catch (e) {
//     // عرض رسالة خطأ للمستخدم
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('حدث خطأ: ${e.toString()}')),
//     );
//   } finally {
//     setState(() => _isUpdating = false);
//   }
// }
}
