import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import '../../../../../common/widgets/dialog/dialog.dart';
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
              return AvailableCouponContainerWeb(discount: MyCouponController.get(context).availableCoupons![index].discount,expiredDate: MyCouponController.get(context).availableCoupons![index].expireDate,);
            },
          ),
          Container(
            width: double.infinity,
            height: 55.h,
            decoration: BoxDecoration(color: AppColors.greenColor, borderRadius: BorderRadius.circular(8.r)),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: CouponInputDialog(),
                  ));
              },
              child: Custom_Text(context, text: 'إضافة قسمية جديدة', style: font14White500W(context,size: 14)),
            ),
          )
        ],
      ),
    );
  }
}