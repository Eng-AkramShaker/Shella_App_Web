import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../../../../../common/util/app_colors.dart';
import '../../../screens/mobile/product_screen.dart';

class DiscountList extends StatelessWidget {
  const DiscountList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {'title': '20 % خصم على منتجات مختارة', 'applied': false},
      {'title': 'خصم 10.00 ر,س مع نقاط المكافئات', 'applied': true},
      {'title': '20 % خصم على منتجات مختارة', 'applied': false},
    ];
    return Column(
      children: [
        buildSectionTitle(context, title: "الاصناف", lapel: "المزيد"),
        SizedBox(height: 15.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              list.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: list[index]['applied'] ? AppColors.wtColor_2 : AppColors.wtColor,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(width: 1, color: AppColors.orangeColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: SvgPicture.asset(
                            list[index]['applied'] ? 'assets/images/precentage.svg' : 'assets/images/sale.svg',
                            width: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Custom_Text(
                          context,
                          text: list[index]['title'],
                          style: font10Black400W(context),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 15,
                                color: AppColors.orangeColor,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Custom_Text(context,
                                  text: list[index]['applied'] ? 'تم تطبيقه' : 'استخدام',
                                  underline: !list[index]['applied'],
                                  style: font8Black400W(context))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
