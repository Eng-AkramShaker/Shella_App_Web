import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/payment/widgets/BottomBar_add_New.dart';
import 'package:shella_design/features/payment/widgets/payment_form.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';

class Add_New_Card_Screen extends StatefulWidget {
  const Add_New_Card_Screen({super.key});

  @override
  State<Add_New_Card_Screen> createState() => _Add_New_Card_ScreenState();
}

class _Add_New_Card_ScreenState extends State<Add_New_Card_Screen> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(
        context,
        title: 'إضافة بطاقة جديدة',
        img: AppImages.icon_v,
        onPressed: () => popRoute(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(context, text: "قائمة البطاقات", style: font14Black600W(context)),
              SizedBox(height: 5.h),
              Custom_Text(context, text: "لديك بطاقتين نشطتين", style: font13Grey400W(context)),

              SizedBox(height: 16.h),

              custom_Images_asset(image: AppImages.visa, h: 210.h, w: width_media(context), fit: BoxFit.fill),

              SizedBox(height: 16.h),

              Custom_Text(context, text: "قائمة البطاقات", style: font14Black600W(context)),
              SizedBox(height: 5.h),

              PaymentForm(),

              //

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar_Add_NewScren(),
    );
  }

  Widget buildSummaryRow(String title, String value, {String? extra, bool isBold = false}) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text(context, text: value, style: font14Black400W(context)),
        Row(
          children: [
            Custom_Text(context, text: title, style: font14Black400W(context)),
            if (extra != null) ...[
              SizedBox(width: 7.w),
              Custom_Text(context, text: "(5 عناصر)", style: font14Grey400W(context)),
            ],
          ],
        ),
      ],
    );
  }
}
