// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/product/widgets/buttons/quantity_selector.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class BottomBar_CartDetails extends StatelessWidget {
  const BottomBar_CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QuantitySelector(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            width: 450.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.white, size: 20),
                      SizedBox(width: 6),
                      Custom_Text(context, text: "أضف إلى السلة", style: font14White400W(context)),
                    ],
                  ),
                  Custom_Text(context, text: "|", style: font14White400W(context)),
                  Row(
                    children: [
                      Custom_Text(context, text: "50 ريال", style: font14White400W(context)),
                      SizedBox(width: 5),
                      Icon(Icons.money, color: AppColors.wtColor, size: 20),
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
