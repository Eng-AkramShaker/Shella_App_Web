import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';

class WebOrderCard extends StatelessWidget {
  final Map<String, String> order;

  const WebOrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 3.h),
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(order['image']!, width: 30.w, height: 80.h),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Custom_Text(
                          context,
                          text: "${order['name']!}  ",
                          size: 18,
                        ),
                        Custom_Text(
                          context,
                          text: order['orderId']!,
                          size: 16,
                        ),
                      ],
                    ),
                    Custom_Text(
                      context,
                      text: order['time']!,
                      size: 14,
                      color: AppColors.darkGreyColor,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 40.w,
                  child: Card(
                    color: AppColors.backgroundColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Custom_Text(context, text: 'قيد الموافقة', size: 14, color: AppColors.greenColor),
                          SizedBox(width: 5.w),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            width: 10,
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 35.w,
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.secondaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Custom_Text(
                        context,
                        text: 'تتبع الطلب',
                        size: 14,
                      ),
                      SizedBox(width: 5.w),
                      Icon(FontAwesome.car, size: 14, color: AppColors.bgColor),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
