import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(color: AppColors.backgroundColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildQuantityButton(Icons.add, backgroundColor: AppColors.primaryColor, color: AppColors.backgroundColor, isAdd: true),
              SizedBox(width: 20.w),
              Custom_Text(context, text: quantity.toString(), style: font18Black600W(context)),
              SizedBox(width: 20.w),
              _buildQuantityButton(Icons.remove, color: AppColors.redColor, isAdd: false),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, {Color? backgroundColor, required Color color, required bool isAdd}) {
    return SizedBox(
      height: 33.h,
      width: 33.w,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isAdd) {
              quantity++;
            } else if (quantity > 1) {
              quantity--;
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2.w),
          ),
          child: Center(child: Icon(icon, color: color, size: size_16(context))),
        ),
      ),
    );
  }
}
