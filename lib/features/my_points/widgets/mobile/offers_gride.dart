import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/my_points/widgets/mobile/gift_image_container_mobile.dart';
import 'package:shella_design/features/my_points/widgets/mobile/offers_mobile.dart';
import 'package:shella_design/features/my_points/widgets/mobile/show_my_points_dialog_mobile.dart';

// ignore: must_be_immutable
class OffersGridMobile extends StatelessWidget {
  Offers offer;
  OffersGridMobile({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ShowMyPointsDialogMobile(
            image: offer.image,
            title: offer.title,
            buttonText: 'استخدام مقابل 600 نقطة',
            discount: true,
            widget: Custom_Text(
              context,
              text:
                  'وفر خصم 15 ر,س على اوردرك من حلي الورد !\nلما اوردرك يكون باكثر من 75 ر,س\nيمكن استخدام هذا الكود لمدة مرتين',
              style: font10Grey400W(context),
            ),
            subTitle: '600 نقطة',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => ShowMyPointsDialogMobile(
                      image: 'assets/images/congrates.png',
                      title: 'اختيار ممتاز يا نور احمد',
                      subTitle: 'لقد حصلت على 15.00 ر.س خصم',
                      widget: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                                width: 1, color: AppColors.orangeColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/dangerous.svg'),
                              SizedBox(
                                width: 20.w,
                              ),
                              Expanded(
                                child: Custom_Text(
                                  context,
                                  text:
                                      'لا تنسى استعمال القسيمة عند مرحلة الدفع',
                                  style: font10Grey400W(context),
                                  maxLines: 1,
                                  textOverFlow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      buttonText: 'اطلب الآن',
                      discount: false,
                      onTap: () {}));
            },
          ),
        );
      },
      child: GiftImageContainerMobile(offer: offer),
    );
  }
}
