import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/lists.dart';

import '../../../common/widgets/dialog/dialog.dart';
import '../domain/models/my_coupon_models.dart';
import 'coupon_widget.dart';

class AvailableCouponWidget extends StatelessWidget {
  List<Coupon> getAvailableCoupons(List<Coupon> coupons) {
    return coupons.where((coupon) => coupon.isAvailable).toList();
  }

  List<Coupon> getUnAvailableCoupons(List<Coupon> coupons) {
    return coupons.where((coupon) => !(coupon.isAvailable)).toList();
  }

  const AvailableCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Coupon> availableCoupons = getAvailableCoupons(coupons);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        getAvailableCoupons(coupons).isEmpty
            ? Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/my_coupon_not_found.png'),
                      Custom_Text(context, text: 'ليس لديك اي قسائم حاليآ', style: font12Grey400W(context))
                    ],
                  ),
                ),
              )
            : ResponsiveLayout.isWeb()
                ? ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: getAvailableCoupons(coupons).length,
                    itemBuilder: (context, index) {
                      return buildCouponList(
                        index: index,
                        list: getAvailableCoupons(coupons),
                      );
                    },
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: getAvailableCoupons(coupons).length,
                      itemBuilder: (context, index) {
                        return buildCouponList(
                          index: index,
                          list: getAvailableCoupons(coupons),
                        );
                      },
                    ),
                  ),
        Container(
          width: double.infinity,
          height: 55.h,
          decoration: BoxDecoration(color: AppColors.greenColor, borderRadius: BorderRadius.circular(8.r)),
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
            child: Custom_Text(context, text: 'إضافة قسمية جديدة', style: font14White500W(context)),
          ),
        )
      ],
    );
  }
}
