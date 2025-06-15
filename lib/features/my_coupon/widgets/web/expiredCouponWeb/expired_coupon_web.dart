import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import '../../../../../common/util/app_styles.dart';
import '../../../../../common/widgets/texts/custom_text.dart';
import '../../../controllers/my_coupon_controller.dart';
import 'expiredCouponContainerWeb/expired_coupon_container_web.dart';

class ExpiredCouponWeb extends StatelessWidget {
  const ExpiredCouponWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCouponController.get(context).unAvailableCoupons!.isEmpty
            ? Padding(
              padding: EdgeInsets.only(top: height(context, 0.2)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/my_coupon_not_found.png'),
                    Custom_Text(context, text: 'ليس لديك اي قسائم حاليآ', style: font12Grey400W(context,size: 12))
                  ],
                ),
              ),
            )
            :
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: MyCouponController.get(context).unAvailableCoupons!.length,
          itemBuilder: (context, index) {
            return ExpiredCouponContainerWeb(discount: MyCouponController.get(context).unAvailableCoupons![index].discount,expiredDate: MyCouponController.get(context).unAvailableCoupons![index].expireDate,);
          },
        ),
      ],
    );
  }
}
