import 'package:flutter/material.dart';
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
                ),
              )
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
      ],
    );
  }
}
