import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/divider/custom_divider.dart';
import 'package:shella_design/features/product/widgets/images/image_circle.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/features/product/widgets/category/category_list.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';
import '../widgets/category/pizza_item.dart';
import '../widgets/discount_list/discount_list.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // ✅ الخلفية والهيدر في الأعلى
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
              // ✅ الحل الصحيح
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle(context, title: "الاصناف", lapel: "المزيد"),
                  SizedBox(height: 15.h),
                  DiscountList(),
                  SizedBox(height: 15.h),
                  SizedBox(width: width_media(context), child: CategoryList()),
                  SizedBox(height: 15.h),
                  Container(
                      color: AppColors.gryColor_8,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Custom_Text(context, text: "ساندويش", style: font14Black600W(context)),
                      )),
                  SizedBox(height: 15.h),
                  buildPizzaItemListView(context),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),

          Positioned(top: 0, left: 0, right: 0, child: buildHeaderSection(context)),

          // title and information about item
          Positioned(
            top: 150,
            child: Card(
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Custom_Text(context, text: "سوبر برغر - جدة - الطريق 11", style: font14Black600W(context)),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Custom_Text(context, text: "ساندويتش، بيتزا", style: font10SecondaryColor600W(context)),
                        Custom_Text(context, text: "\u200E10:00 PM - 1:00 AM", style: font11Black600W(context)),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Custom_Divider(dashed: true, color: AppColors.gryColor_4),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Custom_Text(context, text: "قيمة التوصيل", style: font11Black600W(context)),
                            SizedBox(height: 8.h),
                            Custom_Text(context, text: "25 ريال", style: font10SecondaryColor600W(context)),
                          ],
                        ),
                        Column(
                          children: [
                            Custom_Text(context, text: "المسافة", style: font11Black600W(context)),
                            SizedBox(height: 8.h),
                            Custom_Text(context, text: "15 كم", style: font10Grey600W(context)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 130,
            child: Stack(
              children: [
                ImageCircle(img: AppImages.res_4),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.greenColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildHeaderSection(BuildContext context) {
  return SizedBox(
    height: 210.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        // header image
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.item_66), fit: BoxFit.fill),
            ),
          ),
        ),
        Positioned(
          top: 30.h,
          left: 19.w,
          right: 19.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButtonCircle(
                      icon: Icons.arrow_back_ios,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
              Row(
                children: [
                  IconButtonCircle(icon: Icons.search, onPressed: () {}),
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                      icon: Icons.share,
                      onPressed: () {
                        Share.share('url', subject: 'Sharing Text Field Content');
                      }),
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                      icon: Icons.favorite_border,
                      onPressed: () {
                        popRoute(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildSectionTitle(context, {required title, String? lapel}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text(context, text: title, style: font14Black600W(context)),
        Custom_Text_Button(
          context,
          text: lapel,
          text_style: font14Black600W(context),
          underline: true,
          onPressed: () {},
        )
      ],
    ),
  );
}

Widget buildPizzaItemListView(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.8,
    child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          10,
          (index) => PizzaItem(
            onTap: () {
              pushNewScreen(context, AppRoutes.productDetails);
            },
          ),
        ),
      ),
    ),
  );
}
