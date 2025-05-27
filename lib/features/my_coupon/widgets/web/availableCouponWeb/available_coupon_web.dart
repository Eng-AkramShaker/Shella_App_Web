import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/my_coupon/widgets/mobile/availableCouponMobile/available_coupon_mobile.dart';
import '../../../controllers/my_coupon_controller.dart';
import 'availableCouponContainerWeb/available_coupon_container_web.dart';

class AvailableCouponWeb extends StatelessWidget {

  const AvailableCouponWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context, 0.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyCouponController.get(context).availableCoupons!.isEmpty
            ? Center(
              child: Padding(
                padding: EdgeInsets.only(top: height(context, 0.15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/my_coupon_not_found.png'),
                    Custom_Text(context, text: 'ليس لديك اي قسائم حاليآ', style: font12Grey400W(context,size: 12))
                  ],
                ),
              ),
            ):
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: MyCouponController.get(context).availableCoupons!.length,
            itemBuilder: (context, index) {
              return width(context, 1)<700?
              AvailableCouponMobile(index: index,discount: MyCouponController.get(context).availableCoupons![index].discount,expiredDate: MyCouponController.get(context).availableCoupons![index].expireDate,):
              AvailableCouponContainerWeb(discount: MyCouponController.get(context).availableCoupons![index].discount,expiredDate: MyCouponController.get(context).availableCoupons![index].expireDate,);
            },
          ),
        ],
      ),
    );
  }
}