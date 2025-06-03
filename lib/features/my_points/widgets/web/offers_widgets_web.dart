import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shella_design/common/helper/grid_view_fix_height.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/my_points/widgets/web/show_my_points_dialog_web.dart';

class OffersWidgetsWeb extends StatelessWidget {
  const OffersWidgetsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    List<Offers> items = [
      Offers(
          title: 'خصم 10.00 ر.س على بيغ تيستي',
          image: 'assets/images/im4.png',
          offer: 'خصم  10.00 ر.س',
          point: '600 نقطة'),
      Offers(
          title: 'خصم 05.00 ر.س على برغر كينغ',
          image: 'assets/images/im1.png',
          offer: 'خصم  05.00 ر.س',
          point: '300 نقطة'),
      Offers(
          title: 'خصم 15.00 ر.س على حلي الورد',
          image: 'assets/images/im2.png',
          offer: 'خصم  15.00 ر.س',
          point: '800 نقطة'),
      Offers(
          title: 'خصم 15.00 ر.س على حلي الورد',
          image: 'assets/images/im3.png',
          offer: 'خصم  15.00 ر.س',
          point: '800 نقطة'),
      Offers(
          title: 'خصم 10.00 ر.س على بيغ تيستي',
          image: 'assets/images/im4.png',
          offer: 'خصم  10.00 ر.س',
          point: '600 نقطة'),
      Offers(
          title: 'خصم 05.00 ر.س على برغر كينغ',
          image: 'assets/images/im1.png',
          offer: 'خصم  05.00 ر.س',
          point: '300 نقطة'),
      Offers(
          title: 'خصم 15.00 ر.س على حلي الورد',
          image: 'assets/images/im2.png',
          offer: 'خصم  15.00 ر.س',
          point: '800 نقطة'),
      Offers(
          title: 'خصم 15.00 ر.س على حلي الورد',
          image: 'assets/images/im3.png',
          offer: 'خصم  15.00 ر.س',
          point: '800 نقطة'),
    ];
    return Padding(
      padding:
          ResponsiveLayout.isWeb() ? EdgeInsets.all(32.0.w) : EdgeInsets.zero,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: ResponsiveLayout.isWeb() &&
                    !ResponsiveLayout.isMobile(context) &&
                    !ResponsiveLayout.isTab(context)
                ? 2
                : 2, // Number of columns in the grid
            crossAxisSpacing: ResponsiveLayout.isWeb()
                ? 50.h
                : 15.0.h, // Spacing between columns
            mainAxisSpacing: ResponsiveLayout.isWeb()
                ? 50.h
                : 15.0.w, // Spacing between rows
            height: ResponsiveLayout.isWeb() ? 366.h : 160.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length, // Total number of products
        itemBuilder: (context, index) {
          return OffersGrid(
            offer: items[index],
          );
        },
      ),
    );
  }
}

class OffersGrid extends StatelessWidget {
  final Offers offer;
  const OffersGrid({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ShowMyPointsDialogWeb(
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
                  builder: (context) => ShowMyPointsDialogWeb(
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
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: AppColors.gryColor_3, width: 2.0)),
        child: Padding(
          padding: ResponsiveLayout.isWeb()
              ? EdgeInsets.all(16.0.w)
              : EdgeInsets.zero,
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
                      fit: BoxFit.cover,
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
      ),
    );
  }
}

class Offers {
  String image;
  String offer;
  String title;
  String point;

  Offers(
      {required this.image,
      required this.title,
      required this.offer,
      required this.point});
}
