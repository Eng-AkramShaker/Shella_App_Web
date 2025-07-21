import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/my_points/widgets/mobile/offers_mobile.dart';

class GiftImageContainerMobile extends StatelessWidget {
  const GiftImageContainerMobile({
    super.key,
    required this.offer,
  });

  final Offers offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.gryColor_3, width: 2.0)),
      child: Padding(
        padding:
            ResponsiveLayout.isWeb() ? EdgeInsets.all(16.0.w) : EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Image.asset(
                    offer.image,
                    width: 150.w,
                    height: ResponsiveLayout.isWeb() ? 150.h : 100.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: ResponsiveLayout.isWeb() ? 140.h : 70.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.orangeColor),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/gift.svg',
                          ),
                          SizedBox(width: 5.w),
                          Custom_Text(context,
                              text: offer.offer,
                              style: font6WhiteColor400W(context))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Custom_Text(
              context,
              text: offer.title,
              textOverFlow: TextOverflow.ellipsis,
              maxLines: 1,
              style: font10Black600W(context),
            ),
            SizedBox(
              height: 10.h,
            ),
            Custom_Text(
              context,
              text: offer.point,
              style: font10Grey600W(context),
            ),
          ],
        ),
      ),
    );
  }
}
