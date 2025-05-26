import 'package:flutter/material.dart';
import '../../../../common/util/app_styles.dart';
import '../../../../common/widgets/texts/custom_text.dart';
import '../../controllers/my_coupon_controller.dart';
import 'coupon_widget.dart';

class ExpiredCouponWidget extends StatelessWidget {

  const ExpiredCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCouponController.get(context).unAvailableCoupons!.isEmpty ?
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/my_coupon_not_found.png'),
            Custom_Text(context, text: 'ليس لديك اي قسائم حاليآ', style: font12Grey400W(context))
          ],
        ),
      ),
    ):
    Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: MyCouponController.get(context).unAvailableCoupons!.length,
          itemBuilder: (context, index) {
            return buildCouponList(index: index,discount: MyCouponController.get(context).unAvailableCoupons![index].discount,expiredDate: MyCouponController.get(context).unAvailableCoupons![index].expireDate,);
          },
        ),
      ],
    );
  }
}