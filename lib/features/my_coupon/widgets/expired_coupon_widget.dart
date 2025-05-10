import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_styles.dart';
import 'package:shella_design/util/lists.dart';

import '../domain/models/my_coupon_models.dart';
import 'coupon_widget.dart';
class ExpiredCouponWidget extends StatelessWidget {
  List<Coupon> getUnAvailableCoupons(List<Coupon> coupons) {
    return coupons.where((coupon) => !(coupon.isAvailable)).toList();
  }
  const ExpiredCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getUnAvailableCoupons(coupons).isEmpty?  Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/my_coupon_not_found.png'),
                Custom_Text(context, text: 'ليس لديك اي قسائم حاليآ',style: font12Grey400W(context))
              ],
            ),
          ),
        ):ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: getUnAvailableCoupons(coupons).length,
          itemBuilder: (context, index) {
            return buildCouponList(index: index, list: getUnAvailableCoupons(coupons),);
          },
        ),
      ],
    );
  }
}
