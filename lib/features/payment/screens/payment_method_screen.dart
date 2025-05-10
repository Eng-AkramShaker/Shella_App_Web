import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/container/empty_%20container.dart';
import 'package:shella_design/common/widgets/divider/custom_divider.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_styles.dart';

class Payment_Method_Screen extends StatefulWidget {
  const Payment_Method_Screen({super.key});

  @override
  State<Payment_Method_Screen> createState() => _Payment_Method_ScreenState();
}

class _Payment_Method_ScreenState extends State<Payment_Method_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(
        context,
        title: 'طرق الدفع',
        img: AppImages.icon_v,
        onPressed: () => popRoute(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(context, text: "طرق الدفع", style: font14Black600W(context)),
              SizedBox(height: 25.h),
              InkWell(
                  onTap: () {
                    //
                    pushNewScreen(context, AppRoutes.payment_screen);
                  },
                  child: _paymentMethodRow(context, AppImages.icon_pay, "طرق الدفع")),
              SizedBox(height: 15.h),
              Custom_Divider(),
              SizedBox(height: 1.h),

              //

              InkWell(
                onTap: () {
                  //
                  pushNewScreen(context, AppRoutes.payment_screen);
                },
                child: _paymentOption(
                  context,
                  image: AppImages.icon_stc,
                  title: "Stc Pay",
                  description: "ادفع لطلبك باستخدام رقم الجوال المسجل في STC Pay",
                  buttonTitle: 'New',
                  buttonColor: AppColors.wtColor,
                  borderColor: AppColors.secondaryColor,
                ),
              ),
              _paymentOption(
                context,
                image: AppImages.icon_goo,
                title: "ادفع لاحقًا",
                description: "حاليًا، أنت غير مؤهل لاستخدام Google Pay",
                buttonTitle: 'غير متاح مؤقتًا',
                buttonColor: AppColors.gryColor_6,
                borderColor: AppColors.gryColor_5,
                hasIcon: true,
              ),
              _paymentOption(
                context,
                image: AppImages.icon_cach,
                title: "ادفع الكتروني لاحقًا أو نقدًا",
                description: "ادفع نقدًا أو الكترونيًا بمجرد تسليم الطلب من المندوب",
                buttonTitle: 'غير متاح',
                buttonColor: AppColors.gryColor_6,
                borderColor: AppColors.gryColor_5,
              ),
              Custom_Text(context, text: "بطاقاتي", style: font14Black600W(context)),
              SizedBox(height: 5.h),

              InkWell(
                onTap: () {
                  //
                  pushNewScreen(context, AppRoutes.add_new_card_screen);
                },
                child: _paymentOption(
                  context,
                  image: AppImages.icon_card,
                  title: "إضافة بطاقة جديدة",
                  description: "لا يوجد لديك بطاقات مضافة",
                  buttonTitle: '',
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentMethodRow(BuildContext context, String image, String title) {
    return Row(
      children: [
        custom_Images_asset(image: image, h: 25.h, w: 35.w, fit: BoxFit.fill),
        SizedBox(width: 8.w),
        Custom_Text(context, text: title, style: font14Black400W(context)),
      ],
    );
  }

  Widget _paymentOption(
    BuildContext context, {
    required String image,
    required String title,
    required String description,
    required String buttonTitle,
    Color? buttonColor,
    Color? borderColor,
    bool hasIcon = false,
  }) {
    return Column(
      children: [
        Container_Empty(
          h: 70.h,
          w: width_media(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  custom_Images_asset(image: image, h: 30.h, w: 25.w, fit: BoxFit.fill),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Custom_Text(context, text: title, style: font14Grey500W(context)),
                          if (hasIcon) ...[
                            SizedBox(width: 5.w),
                            Icon(Icons.error_outline, color: AppColors.gryColor_2),
                          ]
                        ],
                      ),
                      Custom_Text(context, text: description, style: font10Grey400W(context)),
                    ],
                  ),
                ],
              ),
              if (buttonTitle.isNotEmpty)
                custom_Button(
                  context,
                  h: 45.h,
                  w: buttonTitle.length > 5 ? 75.w : 45.w,
                  title: buttonTitle,
                  buttoncolor: buttonColor!,
                  border_color: borderColor!,
                  style: font10Grey400W(context),
                  onPressed: () {},
                ),
            ],
          ),
        ),
        SizedBox(height: 1.h),
        Custom_Divider(),
        SizedBox(height: 10.h),
      ],
    );
  }
}
