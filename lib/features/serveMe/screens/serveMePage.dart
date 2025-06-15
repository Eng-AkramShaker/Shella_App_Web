import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/product/widgets/mobile/category/category_item.dart';
import 'package:shella_design/features/serveMe/screens/companiesServices/companiesServicesPage.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/individualsServicePage.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class Servemepage extends StatefulWidget {
  const Servemepage({super.key});

  @override
  State<Servemepage> createState() => _ServemepageState();
}

class _ServemepageState extends State<Servemepage> {
  int isSelected = 0;
  int selectedIndex = 0;
  List<int> img = [7, 8, 2, 1];
  List<String> title = ["خدمة تخدمني", "استلام وتسليم", "المطاعم", "سوبر ماركت"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context,
          style: font12White600W(context, size: size_14(context)), title: "خدمة تخدمني", icon: Icons.work_outline_rounded),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildCategoryListView(context),
              SizedBox(height: 10.h),
              Custom_Text(context, text: 'الرجاء اختيار الخدمة المناسبة ', style: font10Black400W(context, size: size_21(context))),
              Spacer(flex: 1),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: isSelected == 1 ? AppColors.greenColor : AppColors.gryColor_5, width: 2.w),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                    child: SizedBox(
                        height: 100,
                        width: 340,
                        child: Center(
                            child: Row(
                          children: [
                            Custom_Text(context,
                                text: "خدمه الافراد",
                                style: isSelected == 1
                                    ? font10Black400W(context, size: size_16(context))
                                    : font10Grey400W(context, size: size_16(context))),
                            Spacer(flex: 1),
                            ClipOval(
                              child: custom_Images_asset(image: AppImages.individuals, h: 40, w: 40),
                            ),
                            Spacer(flex: 6),
                          ],
                        ))),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 2;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: isSelected == 2 ? AppColors.greenColor : AppColors.gryColor_5, width: 2.w),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                    child: SizedBox(
                        height: 100,
                        width: 340,
                        child: Center(
                            child: Row(
                          children: [
                            Custom_Text(context,
                                text: "خدمه الشركات",
                                style: isSelected == 2
                                    ? font10Black400W(context, size: size_16(context))
                                    : font10Grey400W(context, size: size_16(context))),
                            Spacer(flex: 1),
                            ClipOval(
                              child: custom_Images_asset(image: AppImages.corporate, h: 40, w: 40),
                            ),
                            Spacer(flex: 6),
                          ],
                        ))),
                  ),
                ),
              ),
              Spacer(flex: 1),
              custom_Button(context, title: 'التالي', style: font10White400W(context, size: size_14(context)), h: 45, onPressed: () {
                isSelected == 1
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IndividualsServicePage()),
                      )
                    : isSelected == 2
                        ? Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Companiesservicespage(),
                            ),
                          )
                        : null;
              }),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: List.generate(img.length, (index) {
            return Padding(
              padding: EdgeInsets.only(right: 10.w, left: 3.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 13, left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryItem(h: 75, w: 75, image: 'assets/images/${img[index]}.png', label: title[index]),
                      SizedBox(height: 7),
                      Container(
                        height: 3,
                        width: _getTextWidth(context, title[index]) * 1.3,
                        color: selectedIndex == index ? AppColors.greenColor : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

// دالة لحساب عرض النص
  double _getTextWidth(BuildContext context, String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: font10Black400W(context)),
      maxLines: 1,
      textDirection: TextDirection.rtl,
    )..layout();
    return textPainter.width;
  }
}
