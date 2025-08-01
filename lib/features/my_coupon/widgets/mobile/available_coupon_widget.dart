import 'package:flutter/material.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/dialog/dialog.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';
import '../../controllers/my_coupon_controller.dart';
import 'availableCouponMobile/available_coupon_mobile.dart';

class AvailableCouponWidget extends StatelessWidget {
  const AvailableCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MyCouponController.get(context).availableCoupons!.isEmpty
            ? Expanded(
                child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/my_coupon_not_found.png'),
                    Custom_Text(context,
                        text: 'ليس لديك اي قسائم حاليآ',
                        style: font12Grey400W(context))
                  ],
                ),
              ))
            : Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount:
                      MyCouponController.get(context).availableCoupons!.length,
                  itemBuilder: (context, index) {
                    return AvailableCouponMobile(
                      index: index,
                      discount: MyCouponController.get(context)
                          .availableCoupons![index]
                          .title,
                      expiredDate: MyCouponController.get(context)
                          .availableCoupons![index]
                          .expireDate,
                    );
                  },
                ),
              ),
        SizedBox(
          height: 62,
        ),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.circular(8)),
          child: TextButton(
            onPressed: () {
              if (ResponsiveLayout.isWeb()) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: CouponInputDialog(),
                        ));
              } else {
                showModalBottomSheet<String>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CouponInputDialog();
                    });
              }
            },
            child: Custom_Text(context,
                text: 'إضافة قسمية جديدة', style: font14White500W(context)),
          ),
        )
      ],
    );
  }
}
