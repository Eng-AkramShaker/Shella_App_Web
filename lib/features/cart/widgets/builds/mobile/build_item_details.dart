import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/cart/widgets/mobile/cart_item.dart';
import 'package:shella_design/features/cart/widgets/mobile/counter_iconButton.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/lists.dart';

class BuildItemDetails extends StatefulWidget {
  const BuildItemDetails(
      {super.key, required this.cartItem, required this.index});
  final CartItem cartItem;
  final int index;

  @override
  State<BuildItemDetails> createState() => _BuildItemDetailsState();
}

class _BuildItemDetailsState extends State<BuildItemDetails> {
  void increaseQuantity(int index) => setState(() => items[index].quantity++);
  void decreaseQuantity(int index) => setState(
      () => items[index].quantity > 1 ? items[index].quantity-- : null);
  void removeItem(int index) => setState(() => items.removeAt(index));

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Container(
                height: 24.h,
                width: 24.w,
                child: CounterButton(
                    icon: Icons.cancel,
                    size: 24,
                    color: AppColors.bgColor,
                    onPressed: () => removeItem(widget.index))),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_Text(context,
                      text: "نسكافيه 30 ظرف", style: font11Black600W(context)),
                  Custom_Text(context,
                      text: "عرض 30 ظرف +5 هدية",
                      style: font12Grey400W(context, lineHeight: 2)),
                  Custom_Text(context,
                      text: '50 ريال',
                      style: font13SecondaryColor600W(context)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 94.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              custom_Images_asset(
                  image: widget.cartItem.img,
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
                    Container(
                        height: 24.h,
                        width: 24.w,
                        child: CounterButton(
                            icon: Icons.add_circle,
                            color: AppColors.secondaryColor,
                            onPressed: () => increaseQuantity(widget.index))),
                    Custom_Text(context,
                        text: '${widget.cartItem.quantity}',
                        style: font14Black500W(context)),
                    Container(
                        height: 24.h,
                        width: 24.w,
                        child: CounterButton(
                            icon: Icons.remove_circle_outline,
                            color: AppColors.secondaryColor,
                            onPressed: () => decreaseQuantity(widget.index))),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ],
    );
  }
}
