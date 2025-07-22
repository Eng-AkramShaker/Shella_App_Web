import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/divider/divider_2.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/payment/widgets/bottomBar_pyment.dart';
import 'package:shella_design/features/payment/widgets/paymentOption.dart';
import 'package:shella_design/features/payment/widgets/paymentSummaryRow.dart';
import 'package:shella_design/features/payment/widgets/paymentSwitch.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

// تعريف Provider (إذا كان هنالك حاجة لإدارة الحالة)
class PaymentController with ChangeNotifier {
  // يمكن إضافة أي متغيرات هنا تحتاج إلى مشاركتها بين الـ Widgets
  // مثل بيانات طرق الدفع أو حالة التفعيل لأزرار معينة
}

class MobilePayment extends StatelessWidget {
  const MobilePayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // استخدم Provider لتوفير بيانات PaymentController
    return ChangeNotifierProvider(
      create: (_) => PaymentController(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: customAppBar(
          context,
          title: 'تفاصيل الدفع',
          img: AppImages.icon_v,
          onPressed: () => nav.back(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(
                  context,
                  text: "تفاصيل الدفع",
                  style: font14Black600W(context),
                ),
                SizedBox(height: 25.h),

                paymentOption(
                  context,
                  h: 25.h,
                  w: 30.w,
                  image: AppImages.icon_pay,
                  title: "طرق الدفع",
                  description: "Apple Pay",
                  buttonTitle: 'تغيير',
                  buttonColor: AppColors.secondaryColor,
                  borderColor: AppColors.secondaryColor,
                  style: font11White400W(context),
                  onPressed: () {
                    // استخدم pushNewScreen هنا
                    nav.push(AppRoutes.payment_method_screen);
                  },
                ),
                paymentSwitch(),
                Custom_Text(
                  context,
                  text: "المكافئات والقسائم",
                  style: font14Black600W(context),
                ),
                SizedBox(height: 25.h),

                Container(
                  height: 105.h,
                  width: 175.w,
                  color: AppColors.wtColor,
                  child: Stack(
                    children: [
                      custom_Images_asset(
                        image: AppImages.coupon,
                        h: height_media(context),
                        w: width_media(context),
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                size: 35,
                                color: AppColors.gryColor,
                              ),
                              SizedBox(height: 8.h),
                              Custom_Text(
                                context,
                                text: "اضف قسيمة",
                                style: font12Black400W(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Custom_Text(
                      context,
                      text: 'ملخص الطلب',
                      style: font14Black600W(context),
                    ),
                    Row(
                      children: [
                        Custom_Text_Button(
                          context,
                          text: 'جدولة الطلب',
                          text_style: font14Black600W(context),
                          onPressed: () {
                            // استبدال Get.bottomSheet بـ showModalBottomSheet
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) =>
                                  const ScheduleOrderBottomSheet(),
                            );
                          },
                        ),
                        SizedBox(width: 5.w),
                        Icon(Icons.access_alarm_rounded),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                Custom_Text(
                  context,
                  text:
                      'بتنفيذ طلبك فإنك توافق على الشروط والأحكام . يشمل 15% قيمة الضريبة',
                  style: font10Black600W(context),
                ),
                SizedBox(height: 16.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      PaymentSummaryRow(
                        "المجموع الفرعي",
                        "90 ريال",
                        context: context,
                      ),
                      Cus_Divider(color: AppColors.gryColor_2),
                      PaymentSummaryRow(
                        "الضرائب والرسوم",
                        "0 ريال",
                        context: context,
                      ),
                      Cus_Divider(color: AppColors.gryColor_2),
                      PaymentSummaryRow(
                        "التوصيل",
                        "15 ريال",
                        context: context,
                      ),
                      Cus_Divider(color: AppColors.gryColor_2),
                      PaymentSummaryRow(
                        "الإجمالي",
                        "105 ريال",
                        extra: "(5 عناصر)",
                        isBold: true,
                        context: context,
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),

                //
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar_PymentScren(),
      ),
    );
  }
}

class ScheduleOrderBottomSheet extends StatelessWidget {
  const ScheduleOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('محتوى الجدولة هنا'),
      ),
    );
  }
}
